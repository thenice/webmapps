@import <AppKit/CPTabView.j>
@import <AppKit/CPColorPanel.j>
@import "ColorSwatchView.j"


@implementation InspectorView : CPTabView
{
	CPTextView				layerName								@accessors;
	CPTextView				layerDescription				@accessors;
	CPTextView				externalURL							@accessors;
	CPView						_strokeColorSwatch;						
	
}

- (id)initWithFrame:(CGRect)aFrame {

	    self = [super initWithFrame:aFrame];
	
	
			var tab = [[CPTabViewItem alloc] initWithIdentifier:@"General"];
			[tab setLabel:@"General"];
			var generalInspectorView = [[CPView alloc] initWithFrame:aFrame];
			
			var layerNameLabel = [[CPTextField alloc] initWithFrame:CGRectMake (12, 10, 200, 15)];
      [layerNameLabel setFont:[CPFont boldSystemFontOfSize:11.0]];
			[layerNameLabel setTextColor: [CPColor blackColor]];
			[layerNameLabel setStringValue:@"Layer Name"];
			[generalInspectorView addSubview: layerNameLabel];
			
			layerName = [[CPTextField alloc] initWithFrame:CGRectMake (10, 25, 200, 33)];
      [layerName setFont:[CPFont boldSystemFontOfSize:12.0]];
			[layerName setTextColor: [CPColor blackColor]];
			[layerName setStringValue:@"LayerName"];
			[layerName setBezeled: YES];
			[layerName setEditable: YES];  
			[layerName setBezelStyle:CPTextFieldSquareBezel];
			[generalInspectorView addSubview: layerName];
			
			var layerDescriptionLabel = [[CPTextField alloc] initWithFrame:CGRectMake (12, 68, 200, 15)];
      [layerDescriptionLabel setFont:[CPFont boldSystemFontOfSize:11.0]];
			[layerDescriptionLabel setTextColor: [CPColor blackColor]];
			[layerDescriptionLabel setStringValue:@"Layer Description"];
			[generalInspectorView addSubview: layerDescriptionLabel];
			
			layerDescription = [[CPTextField alloc] initWithFrame:CGRectMake (10, 83, 200, 99)];
      [layerDescription setFont:[CPFont boldSystemFontOfSize:12.0]];
			[layerDescription setTextColor: [CPColor blackColor]];
			[layerDescription setStringValue:@"LayerDescription"];
			[layerDescription setBezeled: YES]; 
			[layerDescription setEditable: YES]; 
			[layerDescription setBezelStyle:CPTextFieldSquareBezel];
			[generalInspectorView addSubview: layerDescription];
			
			var button = [[CPButton alloc] initWithFrame: CGRectMake(135,190,70,25)];
			[button setTitle:@"Update"];
			[button setTarget: self ]
			[button setAction:@selector(submitFilter:)];
			[generalInspectorView addSubview: button];
			
			
			[tab setView: generalInspectorView];
			
			
			// MAP APPEARANCE
			var tab2 = [[CPTabViewItem alloc] initWithIdentifier:@"Map Appearance"];
			[tab2 setLabel:@"Map"];
			var mapInspectorView = [[CPView alloc] initWithFrame:aFrame];
			
			var color = [CPColor colorWithHexString:"222222"];
			var fillColorSwatch = [[ColorSwatchView alloc] initWithFrame:CGRectMake (5, 5, 30, 30) startColor:color];
			var strokeColorSwatch = [[ColorSwatchView alloc] initWithFrame:CGRectMake (5, 40, 30, 30) startColor:color];
			[mapInspectorView addSubview: fillColorSwatch];
			[mapInspectorView addSubview: strokeColorSwatch];
			
			var fillColorLabel = [[CPTextField alloc] initWithFrame:CGRectMake (40, 15, 100, 20)];
      [fillColorLabel setFont:[CPFont boldSystemFontOfSize:11.0]];
			[fillColorLabel setTextColor: [CPColor blackColor]];
			[fillColorLabel setStringValue:@"Fill Color"];
			[mapInspectorView addSubview: fillColorLabel];
			
			var strokeColorLabel = [[CPTextField alloc] initWithFrame:CGRectMake (40, 45, 100, 20)];
      [strokeColorLabel setFont:[CPFont boldSystemFontOfSize:11.0]];
			[strokeColorLabel setTextColor: [CPColor blackColor]];
			[strokeColorLabel setStringValue:@"Stroke Color"];
			[mapInspectorView addSubview: strokeColorLabel];
			
			var strokeWeightLabel = [[CPTextField alloc] initWithFrame:CGRectMake (12, 75, 150, 15)];
      [strokeWeightLabel setFont:[CPFont boldSystemFontOfSize:11.0]];
			[strokeWeightLabel setTextColor: [CPColor blackColor]];
			[strokeWeightLabel setStringValue:@"Stroke Weight:"];
			[mapInspectorView addSubview: strokeWeightLabel];
			
			var strokeWeightLabel = [[CPTextField alloc] initWithFrame:CGRectMake (12, 75, 150, 15)];
      [strokeWeightLabel setFont:[CPFont boldSystemFontOfSize:11.0]];
			[strokeWeightLabel setTextColor: [CPColor blackColor]];
			[strokeWeightLabel setStringValue:@"Stroke Weight:"];
			[mapInspectorView addSubview: strokeWeightLabel];
			
			strokeWeight = [[CPTextField alloc] initWithFrame:CGRectMake (110, 70, 50, 33)];
      [strokeWeight setFont:[CPFont boldSystemFontOfSize:12.0]];
			[strokeWeight setTextColor: [CPColor blackColor]];
			[strokeWeight setStringValue:@"1.0"];
			[strokeWeight setBezeled: YES];
			[strokeWeight setEditable: YES];  
			[strokeWeight setBezelStyle:CPTextFieldSquareBezel];
			[mapInspectorView addSubview: strokeWeight];
			
			var updateButton = [[CPButton alloc] initWithFrame: CGRectMake(10,121,200,24)];
			[updateButton setTitle:@"Update"];
			[updateButton setTarget: self];
			[updateButton setAction:@selector(update:)];
			[mapInspectorView addSubview: updateButton];
			
			
			[tab2 setView: mapInspectorView];

			// LAYER METADATA
			var tab3 = [[CPTabViewItem alloc] initWithIdentifier:@"Layer Metadata"];
			[tab3 setLabel:@"Metadata"];
			var testView3 = [[CPView alloc] initWithFrame:CGRectMakeZero()];
			[tab3 setView: testView3];
			
			[self addTabViewItem: tab];
			[self addTabViewItem: tab2];
			[self addTabViewItem: tab3];
						
	    return self ;
}

- (void)showFillColorPicker:(id)aSender
{
	var colorPanel = [CPColorPanel sharedColorPanel];
	[colorPanel orderFront:self];
	
}

- (void)showStrokeColorPicker:(id)aSender
{
	var colorPanel = [CPColorPanel sharedColorPanel];
	[colorPanel orderFront:self];
	
}


@end
