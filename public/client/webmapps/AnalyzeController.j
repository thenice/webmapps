@import <Foundation/CPObject.j>

var AnalyzeControllerInstance = nil;

@implementation AnalyzeController : CPObject
{
	CPPanel          analyzePanel          @accessors;
	CPPopUpButton    sourcePopup           @accessors;
	CPPopUpButton    comparePopup          @accessors;
	CPPopUpButton    compareMethodPopup    @accessors;
	CPAlert					 waitingWindow         @accessors;
	CPURLConnection  queryConnection       @accessors;
	
}

- (id)init
{
    self = [super init];
    return self ;
}

+ (AnalyzeController)sharedController
{
	if(!AnalyzeControllerInstance)
		AnalyzeControllerInstance = [[AnalyzeController alloc] init];
	return AnalyzeControllerInstance;
}

- (@action)showPanel:(id)aSender
{
	analyzePanel = [[CPPanel alloc] initWithContentRect:CGRectMake(50, 50, 270, 254) styleMask:CPHUDBackgroundWindowMask | CPClosableWindowMask];
	[analyzePanel setFloatingPanel:YES];
	[analyzePanel setTitle:"Spatial Analysis"];
	[self addSourceLayerPopup];
	[self addCompareMethodPopup];
	[self addCompareLayerPopup];
	[self addSubmitButton];
	[analyzePanel orderFront:self];
}

- (@action)addSourceLayerPopup
{
	var contentView = [analyzePanel contentView],
  bounds = [contentView bounds];
	
	sourcePopup = [[CPPopUpButton alloc] initWithFrame: CGRectMake(10,10,250,24)];
	var currentLayers = [Layer all];
	
	var label = [[CPTextField alloc] initWithFrame:CGRectMake (10, 40, 250, 24)];
  [label setFont:[CPFont systemFontOfSize:10.0]];
	[label setStringValue:@"Source Layer"];
	[label setTextColor: [CPColor whiteColor]];
	
	currentLayers.each(function(l) {
		var menuItem = [[CPMenuItem alloc] initWithTitle: [l name] action:nil keyEquivalent:nil];
		[menuItem setTag: l.id];
		[sourcePopup addItem:menuItem];
	});
	
	var surceBuffer = [[CPCheckBox alloc] initWithFrame:CGRectMake (150, 40, 25, 25)];
	[surceBuffer setTag:true];
	[surceBuffer setTarget:self];
	[surceBuffer setAction:@selector(includeBuffer:)];
	
	var sourceBufferLabel = [[CPTextField alloc] initWithFrame:CGRectMake (170, 40, 100, 15)];
	[sourceBufferLabel setStringValue:@"Include Buffer"];
	[sourceBufferLabel setTextColor: [CPColor whiteColor]];
	
	[contentView addSubview: sourceBufferLabel];
	[contentView addSubview: surceBuffer];
	[contentView addSubview: sourcePopup];
	[contentView addSubview: label];
	
	
}

- (@action)addCompareMethodPopup
{
	var contentView = [analyzePanel contentView],
  bounds = [contentView bounds];
	
	compareMethodPopup = [[CPPopUpButton alloc] initWithFrame: CGRectMake(10,80,250,24)];
	var compareMethods = [{'title' : 'Within', 'method': 'within'}, {'title': 'Intersecting', 'method': 'intersects'}, {'title': 'Containing', 'method': 'contains'}, {'title': 'Touching', 'method': 'touches'}, {'title': 'Overlapping', 'method': 'overlaps'}];
	
	var label = [[CPTextField alloc] initWithFrame:CGRectMake (10, 110, 250, 24)];
  [label setFont:[CPFont systemFontOfSize:10.0]];
	[label setStringValue:@"Action"];
	[label setTextColor: [CPColor whiteColor]];
	
	compareMethods.each(function(l) {
		var menuItem = [[CPMenuItem alloc] initWithTitle: l.title action:nil keyEquivalent:nil];
		[menuItem setTag: l.method];
		[compareMethodPopup addItem: menuItem];
	});
	
	[contentView addSubview: compareMethodPopup];
	[contentView addSubview: label];
	
}


- (@action)addCompareLayerPopup
{
	var contentView = [analyzePanel contentView],
  bounds = [contentView bounds];
	
	comparePopup = [[CPPopUpButton alloc] initWithFrame: CGRectMake(10,150,250,24)];
	
	var label = [[CPTextField alloc] initWithFrame:CGRectMake (10, 180, 250, 24)];
  [label setFont:[CPFont systemFontOfSize:10.0]];
	[label setStringValue:@"Compare Layer"];
	[label setTextColor: [CPColor whiteColor]];
	
	var currentLayers = [Layer all];
	currentLayers.each(function(l) {
		var menuItem = [[CPMenuItem alloc] initWithTitle: [l name] action:nil keyEquivalent:nil];
		[menuItem setTag: l.id]
		[comparePopup addItem:menuItem];
	});
	
	
	var compareBuffer = [[CPCheckBox alloc] initWithFrame:CGRectMake (150, 180, 25, 25)];
	[compareBuffer setTag:true];
	[compareBuffer setTarget:self];
	[compareBuffer setAction:@selector(includeBuffer:)];
	
	var compareBufferLabel = [[CPTextField alloc] initWithFrame:CGRectMake (170, 180, 100, 15)];
	[compareBufferLabel setStringValue:@"Include Buffer"];
	[compareBufferLabel setTextColor: [CPColor whiteColor]];
	
	[contentView addSubview: compareBuffer];
	[contentView addSubview: compareBufferLabel];
	[contentView addSubview: comparePopup];
	[contentView addSubview: label];
	
}

- (@action)addSubmitButton
{
	var contentView = [analyzePanel contentView],
  bounds = [contentView bounds];

	var button = [[CPButton alloc] initWithFrame: CGRectMake(10,220,250,24)];
	[button setTitle:@"Perform Analysis"];
	[button setTarget: self ]
	[button setAction:@selector(submit:)];
	[contentView addSubview: button];
	
}

- (void)submit:(id)aSender
{
	var compareID = [[comparePopup selectedItem] tag];
	var compareMethod = [[compareMethodPopup selectedItem] tag];
	var sourceID = [[sourcePopup selectedItem] tag];
	
	var json = "{'projectID' : " + projectId + ", 'query' : {'sourceLayerID' : " + sourceID + ", 'compareMethodName' : '" + compareMethod + "', 'compareLayerID' : " + compareID + ", 'newLayerName' : 'Untitled Layer' }}"
	
	[analyzePanel orderOut:self];
	
	//waitingWindow = [[CPAlert alloc] init];
	//[waitingWindow setMessageText:@"Please wait while the analysis is being performed."];
	//[waitingWindow setTitle:@"In Progress..."];
	//[waitingWindow setWindowStyle:CPHUDBackgroundWindowMask];
	//[waitingWindow runModal];
	
	var request = [CPURLRequest requestWithURL:@"http://localhost:3000/query/execute"];
	[request setHTTPMethod: "POST"];
	[request setHTTPBody: json];
	[request setValue:"application/json" forHTTPHeaderField:"Accept"] ;
	[request setValue:"application/json" forHTTPHeaderField:"Content-Type"] ;
	[CPURLConnection connectionWithRequest:request delegate:self];
	
	
	
}

- (void)connection:(CPURLConnection)aConnection didReceiveData:(CPString)theData
{
    var result = JSON.parse(theData);
		if (result.status == "success")
		{
			//[waitingWindow setMessage: "Your analysis was performed successfully."];
		}
		else
		{
			//[waitingWindow setMessage: "There was an error performing your analysis."];;
		}
}




@end
