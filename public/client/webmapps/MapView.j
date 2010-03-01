@import "CPDOMView.j"

@implementation MapView : CPDOMView
{
    CPString        _apiKey;
    JSObject        _gMap               @accessors(property=gMap);
    BOOL            _mapReady;
    BOOL            _googleAjaxLoaded;
		
}

- (id)initWithFrame:(CGRect)aFrame apiKey:(CPString)apiKey
{
      _apiKey = apiKey;
    	self = [super initWithFrame:aFrame];
			return self;
}

- (void)showMap
{
  var url = 'http://www.google.com/jsapi?key=' + _apiKey;
  var request = [CPURLRequest requestWithURL:url];
  var conn = [CPJSONPConnection sendRequest:request callback:"callback" delegate:self];

}

- (void)connection:(CPJSONPConnection)aConnection didReceiveData:(Object)data
{
    _googleAjaxLoaded = YES;
		
    //console.log("Google AJAX API has loaded");
    // Google API has loaded, now load Google Maps API. The main reason for
    // using this is to avoid polluting the global namespace with G* objects
    function callback() {
		
				var div = document.createElement('div');
				div.id = "map_canvas";
				div.style.width = "100%"
				div.style.height = "100%"
				dom = [self DOMElement];
				dom.appendChild(div);
        _gMap = new GMap2(document.getElementById("map_canvas"));
				_gMap.setCenter(new GLatLng(37.4419, -122.1419), 13);
				_gMap.addControl(new GLargeMapControl());
				_gMap.addControl(new GMapTypeControl());
    };
    // Load Google Maps API v2.160
    google.load('maps', '2.160', {callback: callback});
}



@end

