/*
 * AppController.j
 * NewApplication
 *
 * Created by You on July 5, 2009.
 * Copyright 2009, Your Company All rights reserved.
 */
 
var AppControllerInstance = nil;
 
 
@import <MapKit/MKMapView.j>
@import <Foundation/CPObject.j>
@import <AppKit/CPTableView.j>
@import <AppKit/CPCollectionView.j>
@import "LayerListView.j"
@import "ListedLayerView.j"
@import "Layer.j"
@import "ToolbarDelegate.j"
@import "LayersController.j"
@import "MapController.j"
@import "FeatureGridController.j"
@import "AnalyzeController.j"
@import "InspectorView.j"
@import "MapView.j"
@import "MainMenuController.j"
@import "OpenProjectView.j"
@import "ListedProjectView.j"
@import "Project.j"
@import "ProjectController.j"


 
 
@implementation AppController : CPObject
{
    
}
 
- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
	CPLogRegister(CPLogConsole);
 
  BASE_URL = "http://localhost:3000/";
	activeLayers = {};
	buffers = {};
	selectedFeature = nil;
	selectedLayer = {};
 
	var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
	    contentView = [theWindow contentView],
	    bounds = [contentView bounds];
 
	// initialize map
	_mapView = [[MKMapView alloc] initWithFrame:CGRectMake(300, 0, CGRectGetWidth(bounds), CGRectGetHeight(bounds)) apiKey:'ABQIAAAAnfs7bKE82qgb3Zc2YyS-oBT2yXp_ZAY8_ufC3CFXhHIE1NvwkxSySz_REpPq-4WZA27OwgbtyR3VcA'];
	[[MapController sharedMapController] setMap:_mapView] //set so other methods can access the map

	// -- h split view
	var horizontalSplitView = [[CPSplitView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(bounds), CGRectGetHeight(bounds))];
	[horizontalSplitView setVertical:YES];
	[horizontalSplitView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable]; 
  [contentView addSubview:horizontalSplitView];

	// -- v split view
	var verticalSplitView = [[CPSplitView alloc] initWithFrame:CGRectMake(0, 0, 300, CGRectGetHeight(bounds))];
	[verticalSplitView setVertical:NO];
	[verticalSplitView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable]; 
  [horizontalSplitView addSubview:verticalSplitView];
	
	// -- layerListScroll
	layerListScroll = [[CPScrollView alloc] initWithFrame:CGRectMake(0, 0, 300, 600)];
    [layerListScroll setHasHorizontalScroller:NO] ;
    [layerListScroll setAutohidesScrollers:YES] ;
    [verticalSplitView addSubview:layerListScroll];
 
	// -- Layer List View
		layerListView = [[CPCollectionView alloc] initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth([layerListScroll bounds]), CGRectGetHeight(bounds))];		
			[layerListView setContent:[Layer all]];
			[layerListView setMinItemSize:CGSizeMake(300, 30)];
			[layerListView setDelegate:self];
	   	[layerListView setMaxItemSize:CGSizeMake(300, 30)];
			itemPrototype = [[CPCollectionViewItem alloc] init];
	   	[itemPrototype setView:[[ListedLayerView alloc] initWithFrame:CGRectMakeZero()]];
	   	[layerListView setItemPrototype:itemPrototype];
			[layerListScroll setDocumentView:layerListView];
			
		 // -- InspectorView
			inspectorView = [[InspectorView alloc] initWithFrame: CGRectMake(0, 500, 300, 400)];
			//[inspectorView setBackgroundColor: [CPColor colorWithHexString:"990000"]];
			[verticalSplitView addSubview: inspectorView];
			    
	// -- _mapView
  [_mapView setAutoresizingMask:CPViewHeightSizable | CPViewWidthSizable];
	[horizontalSplitView addSubview:_mapView];	
 
	// --- the toolbar
  var toolbar = [[CPToolbar alloc] initWithIdentifier:"toolbar"] ;
 	var toolbarDelegate = [[ToolbarDelegate alloc] init] ;
  [toolbar setDelegate:toolbarDelegate];
  [toolbar setVisible:YES] ;
  [theWindow setToolbar:toolbar];	

 
	[theWindow orderFront:self];
 
	// Uncomment the following line to turn on the standard menu bar.
	var mainBundle = [CPBundle mainBundle];
	var imagePath = [mainBundle pathForResource:@"layer.png"];
	var layerImage = [[CPImage alloc] initWithContentsOfFile:imagePath size:CGSizeMake(20, 20)];
	
	mainMenu = [MainMenuController sharedController];
	var sharedApplication = [CPApplication sharedApplication];
	var menu = [mainMenu menu];
	[CPMenu setMenuBarTitle:projectTitle];
	[sharedApplication setMainMenu:menu];
  [CPMenu setMenuBarVisible:YES];

 
	testLayer = [[Layer alloc] initWithIdentifier:65];
 
	//featureGridController = [FeatureGridController sharedController];
	//[featureGridController setLayer:testLayer];
	
}
 
// the user has selected a different layer from the layer list
-(void)collectionViewDidChangeSelection:(CPCollectionView)collectionView
{
	selectedLayer = collectionView._content[[[collectionView selectionIndexes] firstIndex]];
	
}
@end