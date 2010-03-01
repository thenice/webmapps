/*** Layer.j **/
@import <Foundation/CPObject.j>
 
var layerList = nil;
		
@implementation Layer : CPObject
{
    CPString        id          				@accessors;
    CPString        name                @accessors;
    Date            createdAt           @accessors;
    Date            updatedAt           @accessors;
    BOOL						isLoaded						@accessors;
		CPArray					columnNames					@accessors;
    CPArray         features            @accessors;
		CPArray					filters							@accessors;
		CPColor					fillColor						@accessors;
		CPColor					strokeColor					@accessors;
		JSObject				srokeWeight					@accessors;						

}
 
- (id)initWithIdentifier:(int)anId
{
	self = [super init];
 
  	if (self)
  	{
    	id = anId;
        name = @"";
    }
    
    return self;
}

// depricated... use initWithIdentifier
- (id)init:(int)anId
{
	self = [super init];
 
  	if (self)
  	{
    	id = anId;
        name = @"";
    }
    
    return self;
}
 
+ (CPArray)all
{		
	if (layerList == nil)
	{
		var array = [CPArray array];
    
    var count = [layers count];
    for (var i = 0; i < count; i++)
    {
        var l = layers[i];
        
	    layer = [[Layer alloc] initWithIdentifier:l.layer.id];
	    [layer setName:l.layer.name];
	    [array addObject:layer];
	}
		// sets static variable layerList with layers loaded at open.
    layerList = array;
	}
	return layerList;   
}

+ (void)refreshLayers
{
	var request = [CPURLRequest requestWithURL:@"http://localhost:3000/projects/layers/" + projectId + ".json"];
	[request setHTTPMethod: "GET"];
	[request setValue:"application/json" forHTTPHeaderField:"Accept"] ;
	[request setValue:"application/json" forHTTPHeaderField:"Content-Type"];
	var getAllLayerDelegate = [[GetAllLayerDelegate alloc] init];
	[CPURLConnection connectionWithRequest:request delegate:getAllLayerDelegate];
}

+ (void)updateLayerList:(CPArray)aList
{
	layerList = aList;
}
 
- (int)numberOfRowsInTableView:(CPTableView)tableView
{
	return [features count];
}
 
- (id)tableView:(CPTableView)tableView objectValueForTableColumn:(CPTableColumn)tableColumn row:(int)row
{	
	var columnName = [tableColumn identifier];
	return features[row][columnName];	
}
 
@end


@implementation GetAllLayerDelegate : CPObject

- (void)connection:(CPURLConnection)aConnection didReceiveData:(CPString)theData
{
	var layers = [];
	var result = JSON.parse(theData);
	result.each(function(current) {
		var currentLayerJSON = current.layer;
		var currentLayer = [[Layer alloc] initWithIdentifier: currentLayerJSON.id];
		currentLayer.name = currentLayerJSON.name;
		layers.push(currentLayer);
	});
	[Layer updateLayerList:layers];
	[layerListView setContent: layers];
}

@end
	