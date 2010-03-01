@import <AppKit/CPMenu.j>
@import <AppKit/CPMenuItem.j>

var sharedMainMenuController = nil;

@implementation MainMenuController : CPObject
{
	CPMenu					menu				@accessors;
}
 
- (id)init
{
    self = [super init];
		menu = [[CPMenu alloc] init];
		[self buildMenu];
		return self ;
}

- (void)buildMenu
{
	var fileMenuItem = [[CPMenuItem alloc] initWithTitle:@"File" action:@selector(showAlert:) keyEquivalent:@"1"]
	var shareMenuItem = [[CPMenuItem alloc] initWithTitle:@"Share" action:@selector(showAlert:) keyEquivalent:@"2"]
	var communityMenuItem = [[CPMenuItem alloc] initWithTitle:@"Community" action:@selector(showAlert:) keyEquivalent:@"3"]
	var settingsMenuItem = [[CPMenuItem alloc] initWithTitle:@"Settings" action:@selector(showAlert:) keyEquivalent:@"4"]
	var logoutMenuItem = [[CPMenuItem alloc] initWithTitle:@"Logout" action:@selector(showAlert:) keyEquivalent:@"5"]
	
	[menu addItem:fileMenuItem];
	[menu addItem:shareMenuItem];
	[menu addItem:communityMenuItem];
	[menu addItem:[CPMenuItem separatorItem]];
	[menu addItem:logoutMenuItem];
	[menu addItem:settingsMenuItem];
	
	var fileMenu = [[CPMenu alloc] init];
	var shareMenu = [[CPMenu alloc] init];
	var communityMenu = [[CPMenu alloc] init];
	var settingsMenu = [[CPMenu alloc] init];
	
	[fileMenuItem setSubmenu: fileMenu];
	[shareMenuItem setSubmenu: shareMenu];
	[communityMenuItem setSubmenu: communityMenu];
	[settingsMenuItem setSubmenu: settingsMenu];
	
	// file menu items
	var openItem = [[CPMenuItem alloc] initWithTitle:@"Open" action:@selector(openProject:) keyEquivalent:@"1"];
	var importItem = [[CPMenuItem alloc] initWithTitle:@"Import" action:@selector(importLayer:) keyEquivalent:@"1"];
	[importItem setTarget: self];
	[openItem setTarget: self];
	[fileMenu addItem: openItem];
	[fileMenu addItem: importItem];
		
	// share menu items
	var buildWebApp = [[CPMenuItem alloc] initWithTitle:@"Webapp From Selected" action:@selector(showAlert:) keyEquivalent:@"1"];
	var shareWith = [[CPMenuItem alloc] initWithTitle:@"Group Sharing" action:@selector(usersAndGroups:) keyEquivalent:@"1"];
	var exportAs = [[CPMenuItem alloc] initWithTitle:@"Export As" action:@selector(showAlert:) keyEquivalent:@"1"];
	[shareWith setTarget: self];
	[shareMenu addItem: buildWebApp];
	[shareMenu addItem: shareWith];
	[shareMenu addItem: exportAs];
}

- (void)setTitle:(CPString)aTitle
{
	[menu setTitle: aTitle];
}

- (@action)importLayer:(id)aSender
{
	var importPanel = [[CPPanel alloc] initWithContentRect:CGRectMake(50, 50, 500, 350) styleMask: CPClosableWindowMask];
	var content = [importPanel contentView];
	[importPanel setFloatingPanel:YES];
	[importPanel setTitle:"Import Layer"];
	webView = [[CPWebView alloc] initWithFrame: [content bounds]];
	[webView setMainFrameURL:BASE_URL + "projects/" + projectId + "/import_layer/new"];
	[content addSubview: webView];
	[importPanel orderFront:self];
}

- (@action)openProject:(id)aSender
{
	var openWindow = [[OpenProjectView alloc] init];
}

- (@action)usersAndGroups:(id)aSender
{
	var usersAndGroupsPanel = [[CPPanel alloc] initWithContentRect:CGRectMake(50, 50, 500, 350) styleMask: CPClosableWindowMask];
	var content = [usersAndGroupsPanel contentView];
	[usersAndGroupsPanel setFloatingPanel:YES];
	[usersAndGroupsPanel setTitle:"Users and Groups Panel"];
	webView = [[CPWebView alloc] initWithFrame: [content bounds]];
	[webView setMainFrameURL:BASE_URL + "projects/" + projectId + "/sharing/"];
	[content addSubview: webView];
	[usersAndGroupsPanel orderFront:self];	
}

+ (MainMenuController)sharedController
{
	if(!sharedMainMenuController)
		sharedMainMenuController = [[MainMenuController alloc] init];
	return sharedMainMenuController;
}


@end
