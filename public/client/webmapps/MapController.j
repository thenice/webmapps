@import <Foundation/CPObject.j>

var MapControllerInstance = nil;

@implementation MapController : CPObject
{
	MKMapView map @accessors;
}

- (id)init
{
    self = [super init] ;
    return self ;
}



- (void)mapXML:(CPString)xmlURL
{
	var gx = new GGeoXml("http://kml.lover.googlepages.com/my-vacation-photos.kml", function() {
		map._gmap.addOverlay(gx);
		alert(gx.loadedCorrectly());
	} );

}

+ (MapController)sharedMapController
{
	if (!MapControllerInstance)
		MapControllerInstance = [[MapController alloc] init];
	return MapControllerInstance;
}


@end
