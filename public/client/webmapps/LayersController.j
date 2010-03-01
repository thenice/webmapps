@import <Foundation/CPObject.j>

var LayersControllerInstance = nil;

@implementation LayersController : CPObject
{
	CPCollectionView layersList @accessors;
}

- (id)init
{
    self = [super init];
    return self ;
}

+ (LayersController)sharedLayersController
{
	if(!LayersControllerInstance)
		LayersControllerInstance = [[LayersController alloc] init];
	return LayersControllerInstance;
}

- (CPArray)checkedLayers
{
	return layerListView._items.select(function(layer) { return layer._view.isVisible._value == 1; } );
}

- (@action)dataView:(id)aSender
{
	var items = [layerListView content];
	var index = [[layerListView selectionIndexes] firstIndex];
	var theLayer = [[Layer alloc] initWithIdentifier: items[index].id];
	var featureGridController = [FeatureGridController sharedController];
	[featureGridController setLayer:theLayer];
}

- (CPArray)uncheckedLayers
{
	return layerListView._items.select(function(layer) { return layer._view.isVisible._value !=1; } );
}

- (void)layerWasChecked:(id)sender
{
	if ([sender objectValue] == CPOnState) {
		new Ajax.Request("/layers/map/" + [sender tag] + ".js", { 'method' : 'get' });
	}
	else if ([sender objectValue] == CPOffState) {
		[self removeLayer:[sender tag]];
	}
	
}

- (void)removeLayer:(int)anId
{
	activeLayers[anId].each(function(featureHash) { featureHash.shape.remove() });
	activeLayers[anId] = null;
}

@end
