/** FeatureGridController.j **/
 
@import <Foundation/CPObject.j>
@import "FeaturesToolbarDelegate.j"
@import "AddFilterDelegate.j"
 
 
var SharedController;
 
@implementation FeatureGridController : CPObject
{
    CPWindow            _featuresWindow;
    CPTableView         _tableView			@accessors;
    Layer               layer           @accessors;
		CPPanel							_filterWindow		@accessors;
		CPPanel							_bufferWindow		@accessors;
    CPPopUpButton       featuresListPopup;
    CPPopUpButton       operationsListPopup;
    CPTextField         value;
		CPTextField         bufferDistance;
		CPArray							_filterViews		@accessors;
}
 
+ (id)sharedController
{
    if (!SharedController)
        SharedController = [[FeatureGridController alloc] init];
    
    return SharedController;
}
 

- (@action)showWindow:(id)aSender
{
    if (_featuresWindow) { return [_featuresWindow orderFront:self]; }
 
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMake(50.0, 50.0, 400.0, 400.0) styleMask:CPTitledWindowMask | CPClosableWindowMask | CPResizableWindowMask],
				contentView = [theWindow contentView],
        bounds = [contentView bounds];

    // set instance variables to store features window
    _featuresWindow = theWindow;
		[_featuresWindow setTitle:@"Data View:  " + layer.name];
		
		// instantiate tableview
		_tableView = [[CPTableView alloc] initWithFrame:bounds];
		[_tableView setGridStyleMask:CPTableViewSolidHorizontalGridLineMask | CPTableViewSolidVerticalGridLineMask];
		[_tableView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
		[_tableView setDelegate: self];
		
		// toolbar
	  var toolbar = [[CPToolbar alloc] initWithIdentifier:"features_toolbar"] ;
	 	var toolbarDelegate = [[FeaturesToolbarDelegate alloc] init] ;
	  [toolbar setDelegate:toolbarDelegate];
	  [toolbar setVisible:YES] ;
	  [theWindow setToolbar:toolbar];
    
		// add filters
		var lastFilterHeight = 0;
		_filterViews = [];
		if (layer.filters != null) {
			layer.filters.each(function(filter) {
				var filterView = [[CPView alloc] initWithFrame:CGRectMake (0, lastFilterHeight, CGRectGetWidth(bounds), 25)];
				[filterView setBackgroundColor: [CPColor colorWithHexString:"990000"]];
				[filterView setAutoresizingMask:CPViewWidthSizable];
				var filterBounds = [filterView bounds];
				var filterLabel = [[CPTextField alloc] initWithFrame:CGRectMake (0, 0, CGRectGetWidth(filterBounds), CGRectGetHeight(filterBounds))];
	      [filterLabel setFont:[CPFont systemFontOfSize:12.0]];
				[filterLabel setTextColor: [CPColor whiteColor]];
				var filterDisplayText = "Filter: " + filter.column_name + " " + filter.operation + " " + filter.value
				[filterLabel setStringValue:filterDisplayText];
				
				var removedFilterButton = [[CPButton alloc] initWithFrame: CGRectMake((CGRectGetWidth(filterBounds) - 25),0,20,20)];
				[removedFilterButton setTitle:@"X"];
				[removedFilterButton setTag: filter.id];
				[removedFilterButton setAutoresizingMask: CPViewMinXMargin]; 
				[removedFilterButton setTarget: self ];
				[removedFilterButton setAction:@selector(removeFilter:)];
				
				lastFilterHeight += 25;
				_filterViews.push({'id' : filter.id, 'view' : filterView});
				[filterView addSubview:filterLabel];
				[filterView addSubview:removedFilterButton];
				[contentView addSubview:filterView];
			});
		}

		// add header columns
		layer.columnNames.each(function(name) {			
			// create the column
			var column = [[CPTableColumn alloc] initWithIdentifier:name];
			[column setResizingMask: CPTableColumnAutoresizingMask];
	    [column setWidth:100.0];
			var columnTitle = [[CPTextField alloc] initWithFrame:CGRectMake (0, lastFilterHeight, 100, 25)];
      [columnTitle setFont:[CPFont boldSystemFontOfSize:11.0]];
			[columnTitle setStringValue:name];
			[column setHeaderView: columnTitle];
			[_tableView addTableColumn:column];
			
		});
		
		// add scroll view for table
		var startHeight = lastFilterHeight + 25;
    var scrollView = [[CPScrollView alloc] initWithFrame:CGRectMake(0,startHeight, CGRectGetWidth(bounds), (CGRectGetHeight(bounds) -25))];
    [scrollView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    [scrollView setAutohidesScrollers:NO];
    [contentView addSubview:scrollView];
    [scrollView setDocumentView:_tableView];

		// display the window
    [_featuresWindow orderFront:self];
}

- (@action)removeFilter:(id)aSender
{
	var request = [CPURLRequest requestWithURL:@"http://localhost:3000/layer_filters/destroy/" + [aSender tag]];
	[request setHTTPMethod: "DELETE"];
	[request setValue:"application/json" forHTTPHeaderField:"Accept"] ;
	[request setValue:"application/json" forHTTPHeaderField:"Content-Type"];
	var removeFilterDelegate = [[RemoveFilterDelegate alloc] init];
	[CPURLConnection connectionWithRequest:request delegate:removeFilterDelegate];
}

- (@action)newLayerFromFilters:(id)aSender
{
	var request = [CPURLRequest requestWithURL:@"http://localhost:3000/layers/new_from_filters/" + [layer id] + "/" + projectId];
	[request setHTTPMethod: "POST"];
	[request setValue:"application/json" forHTTPHeaderField:"Accept"] ;
	[request setValue:"application/json" forHTTPHeaderField:"Content-Type"];
	var newLayerFromFilterDelegate = [[NewLayerFromFilterDelegate alloc] init];
	[CPURLConnection connectionWithRequest:request delegate:newLayerFromFilterDelegate];
}
 
// sets to a new layer, and opens a features window with that layer.
- (void)setLayer:(Layer)aLayer
{

    layer = aLayer;
    [CPURLConnection connectionWithRequest:[CPURLRequest requestWithURL:@"http://localhost:3000/layers/" + [layer id] + ".json?filtered=true"] delegate:self];
}

// select
- (@action)selected:(id)aSender
{
	var index = [[_tableView selectedRowIndexes] firstIndex];
	alert(layer.features[index].id);
}

// open add  filter window
- (@action) openAddFilterWindow:(id)aSender
{
	_filterWindow = [[CPPanel alloc] initWithContentRect:CGRectMake(100, 50, 270, 300) styleMask:CPHUDBackgroundWindowMask | CPClosableWindowMask];
	[_filterWindow setFloatingPanel:YES];
	[_filterWindow setTitle:"Add Filter"];
	[_filterWindow orderFront:self];
	var fwContent = [_filterWindow contentView];

	// column list
	featuresListPopup = [[CPPopUpButton alloc] initWithFrame: CGRectMake(10,10,250,24)];
		
	var columnLabel = [[CPTextField alloc] initWithFrame:CGRectMake (10, 40, 250, 24)];
  [columnLabel setFont:[CPFont systemFontOfSize:10.0]];
	[columnLabel setStringValue:@"Column Name"];
	[columnLabel setTextColor: [CPColor whiteColor]];
	
	layer.columnNames.each(function(columnName) {
		var menuItem = [[CPMenuItem alloc] initWithTitle: columnName action:nil keyEquivalent:nil];
		[menuItem setTag: columnName];
		[featuresListPopup addItem: menuItem];
	});
	
	operationListPopup = [[CPPopUpButton alloc] initWithFrame: CGRectMake(10,90,250,24)];
		
	// operations
	var operationsLabel = [[CPTextField alloc] initWithFrame:CGRectMake (10, 120, 250, 24)];
  [operationsLabel setFont:[CPFont systemFontOfSize:10.0]];
	[operationsLabel setStringValue:@"Operation"];
	[operationsLabel setTextColor: [CPColor whiteColor]];
	
	var operations = ['<', '<=','=', '>', '>='];
	
	operations.each(function(operation) {
		var menuItem = [[CPMenuItem alloc] initWithTitle: operation action:nil keyEquivalent:nil];
		[menuItem setTag: operation];
		[operationListPopup addItem: menuItem];
	});
	
	// value
	var value = [[CPTextField alloc] initWithFrame:CGRectMake(10, 170, 250, 30)];
	
	var valueLabel = [[CPTextField alloc] initWithFrame:CGRectMake (10, 210, 250, 24)];
  [valueLabel setFont:[CPFont systemFontOfSize:10.0]];
	[valueLabel setStringValue:@"Value"];
	[valueLabel setTextColor: [CPColor whiteColor]];
	
	[value setStringValue:@"value"]; 
	[value setFont:[CPFont boldSystemFontOfSize:12.0]]; 
	[value setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin]; 
	[value setEditable:YES]; 
	[value setBordered:YES]; 
	[value setBezeled: YES]; 
	[value setBezelStyle:CPTextFieldSquareBezel];
	
	var button = [[CPButton alloc] initWithFrame: CGRectMake(10,260,250,24)];
	[button setTitle:@"Add Filter"];
	[button setTarget: self ]
	[button setAction:@selector(submitFilter:)];
	
	[fwContent addSubview: button];
	
	[fwContent addSubview: featuresListPopup];
	[fwContent addSubview: columnLabel];
	
	[fwContent addSubview: operationListPopup];
	[fwContent addSubview: operationsLabel];
	
	[fwContent addSubview: value];
	[fwContent addSubview: valueLabel];
	
	[fwContent addSubview: button];
	
}

- (@action)submitFilter:(id)aSender
{
	var columnName = [[featuresListPopup selectedItem] tag];
	var operation = [[operationListPopup selectedItem] tag];
	var filterValue = [value stringValue];
	var json = "{\"layer_filter\" : { \"layer_id\" : " + layer.id + ", \"column_name\" : \"" + columnName + "\", \"operation\" : \"" + operation + "\", \"value\" : \"" + filterValue + "\"}}"
	
	var request = [CPURLRequest requestWithURL:@"http://localhost:3000/layer_filters/create"];
	[request setHTTPMethod: "POST"];
	[request setHTTPBody: json];
	[request setValue:"application/json" forHTTPHeaderField:"Accept"] ;
	[request setValue:"application/json" forHTTPHeaderField:"Content-Type"];
	var addFilterDelegate = [[AddFilterDelegate alloc] init];
	[CPURLConnection connectionWithRequest:request delegate:addFilterDelegate];
	
}

- (@action)showBufferWindow:(id)aSender
{
	_bufferWindow = [[CPPanel alloc] initWithContentRect:CGRectMake(100, 50, 270, 108) styleMask:CPHUDBackgroundWindowMask | CPClosableWindowMask];
	[_bufferWindow setFloatingPanel:YES];
	[_bufferWindow setTitle:"Add Buffer"];
	[_bufferWindow orderFront:self];
	var bufferContent = [_bufferWindow contentView];
	
	bufferDistance = [[CPTextField alloc] initWithFrame:CGRectMake(10, 10, 250, 30)];
	var distanceLabel = [[CPTextField alloc] initWithFrame:CGRectMake (10, 45, 250, 24)];
  [distanceLabel setFont:[CPFont systemFontOfSize:10.0]];
	[distanceLabel setStringValue:@"Distance in meters"];
	[distanceLabel setTextColor: [CPColor whiteColor]];
	
	[bufferDistance setStringValue:@"1000"]; 
	[bufferDistance setFont:[CPFont boldSystemFontOfSize:12.0]]; 
	[bufferDistance setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin]; 
	[bufferDistance setEditable:YES]; 
	[bufferDistance setBordered:YES]; 
	[bufferDistance setBezeled: YES]; 
	[bufferDistance setBezelStyle:CPTextFieldSquareBezel];
	
	var button = [[CPButton alloc] initWithFrame: CGRectMake(10,74,250,24)];
	[button setTitle:@"Set Buffer"];
	[button setTarget: self ];
	[button setAction:@selector(addBuffer:)];
	
	[bufferContent addSubview: bufferDistance];
	[bufferContent addSubview: distanceLabel];
	[bufferContent addSubview: button];
	
}

- (@action)addBuffer:(id)aSender
{
	var request = [CPURLRequest requestWithURL:@"http://localhost:3000/layers/buffer/" + [layer id] + ".js?meters=" + [bufferDistance stringValue]];
	[request setHTTPMethod: "GET"];
	[request setValue:"application/json" forHTTPHeaderField:"Accept"] ;
	[request setValue:"application/json" forHTTPHeaderField:"Content-Type"];
	var addBufferDelegate = [[AddBufferDelegate alloc] init];
	[CPURLConnection connectionWithRequest:request delegate:addBufferDelegate];
}

-  (@action)tableViewSelectionDidChange:(id)aSender
{
	var index = [[_tableView selectedRowIndexes] firstIndex];
	var column = [_tableView tableColumnWithIdentifier:@"id"];
	var layer = [_tableView dataSource];
	var featureID = [layer tableView:_tableView objectValueForTableColumn:column row:index];
	
	var request = [CPURLRequest requestWithURL:@"http://localhost:3000/layers/" + [layer id] + "/features/select/" + featureID + ".js"];
	[request setHTTPMethod: "GET"];
	[request setValue:"application/json" forHTTPHeaderField:"Accept"] ;
	[request setValue:"application/json" forHTTPHeaderField:"Content-Type"];
	var mapFeatureDelegate = [[MapFeatureDelegate alloc] init];
	[CPURLConnection connectionWithRequest:request delegate:mapFeatureDelegate];
	
}

// delegate for request of all the features for a layer
- (void)connection:(CPURLConnection)aConnection didReceiveData:(CPString)theData
{
		// clear the old window...
		_tableView = nil;
		[_featuresWindow close];
		_featuresWindow = nil;
		_filterViews = nil;
		
    var result = JSON.parse(theData);
    [layer setFeatures: result.features];
		[layer setFilters: result.filters];
		[layer setName:result.name];
		[layer setColumnNames:result.column_names];
		[self showWindow:self];
		[_tableView setDataSource:layer];
		

  
}

- (CPView)getFilterView:(int)anID
{
	return _filterViews.select(function(f) {
		return f.id == anID;
	})[0].view;
}

-(@action)verticalShift:(int)shiftValue
{
	[[_featuresWindow contentView] subviews].each(function(view) {
		var currentBounds = [view bounds];
		[view setBounds:CGRectMake(CGRectGetMinX(currentBounds),(CGRectGetMinY(currentBounds) + shiftValue) ,CGRectGetWidth(currentBounds),CGRectGetHeight(currentBounds))]
	});
}

	
@end

@implementation RemoveFilterDelegate : CPObject
// delegate for request of all the features for a layer
- (void)connection:(CPURLConnection)aConnection didReceiveData:(CPString)theData
{
	// remove the filter
	var result = JSON.parse(theData);
	var featureGridController = [FeatureGridController sharedController];
	var filter = [featureGridController getFilterView: result.id];
	[filter removeFromSuperview];
	
	//reset the table
	var layer = [featureGridController layer];
	[featureGridController setLayer:layer];	
}
@end

@implementation NewLayerFromFilterDelegate : CPObject

- (void)connection:(CPURLConnection)aConnection didReceiveData:(CPString)theData
{
	[Layer refreshLayers];
}

@end

@implementation AddBufferDelegate : CPObject

- (void)connection:(CPURLConnection)aConnection didReceiveData:(CPString)theData
{
	eval(theData);
}

@end

@implementation MapFeatureDelegate : CPObject

- (void)connection:(CPURLConnection)aConnection didReceiveData:(CPString)theData
{
	if (selectedFeature != null)
	{
		selectedFeature.remove();
	}
	eval(theData);
}


@end


