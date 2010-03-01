
@implementation OpenProjectView : CPView
{
	CPPanel									_window;
	CPView									_contentView;
	CPArray									_projects;
	CPCollectionView				_projectsList;
}

- (id) init
{
	self = [super init];
	_projects = [];
	_window = [[CPPanel alloc] initWithContentRect:CGRectMake(100, 50, 450, 350) styleMask: CPClosableWindowMask];
	[_window setFloatingPanel:NO];
	_contentView = [_window contentView];
	[self setupWindow];
	[_window setTitle:"Open Project"];
	[_window orderFront:self];
}

- (void)setupWindow
{
	var request = [CPURLRequest requestWithURL:BASE_URL + "projects.json"];
	[request setHTTPMethod: "GET"];
	[request setValue:"application/json" forHTTPHeaderField:"Accept"] ;
	[request setValue:"application/json" forHTTPHeaderField:"Content-Type"];
	[CPURLConnection connectionWithRequest:request delegate:self];
	
}

- (void)drawWindow
{
		// -- projects list scroll
		var projectListScroll = [[CPScrollView alloc] initWithFrame:CGRectMake(0, 0, 450, 300)];
	  [projectListScroll setHasHorizontalScroller:NO] ;
	  [projectListScroll setAutohidesScrollers:YES] ;
		[_contentView addSubview:projectListScroll];

		_projectsList = [[CPCollectionView alloc] initWithFrame: CGRectMake(0,0,CGRectGetWidth([_contentView bounds]), CGRectGetHeight([_contentView bounds]))];
		[_projectsList setContent: _projects];
		[_projectsList setMinItemSize:CGSizeMake(CGRectGetWidth([_contentView bounds]), 30)];
	 	[_projectsList setMaxItemSize:CGSizeMake(CGRectGetWidth([_contentView bounds]), 30)];
		itemPrototype = [[CPCollectionViewItem alloc] init];
	 	[itemPrototype setView:[[ListedProjectView alloc] initWithFrame:CGRectMakeZero()]];
	 	[_projectsList setItemPrototype:itemPrototype];
	
		[projectListScroll setDocumentView:_projectsList];
		
		// -- button
		var openButton = [[CPButton alloc] initWithFrame: CGRectMake(175,310.25,100,25)];
		[openButton setTitle:@"Open Project"];
		projectController = [ProjectController sharedController];
		[openButton setTarget: self]
		[openButton setAction:@selector(switchProjects:)];
		[_contentView addSubview: openButton];};
		
- (@action)switchProjects:(id)aSender
{
	var projectController = [ProjectController sharedController];
	var projects = [_projectsList content]
	var index = [[_projectsList selectionIndexes] firstIndex];
	var selectedProject = projects[index];
	[projectController switchProject: selectedProject];
	[_window close];
}

- (void)connection:(CPURLConnection)aConnection didReceiveData:(CPString)theData
{
	var projects = [];
	var result = JSON.parse(theData);
	result.each(function(current) {
		var currentProjectJSON = current.project;
		var currentProject = [[Project alloc] initWithIdentifier: currentProjectJSON.id];
		currentProject.title = currentProjectJSON.title;
		projects.push(currentProject);
	});
	_projects = projects;
	[self drawWindow];
}

@end
	
