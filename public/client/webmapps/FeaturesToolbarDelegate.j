@import <Foundation/CPObject.j>

var ImportLayerToolbarIdentifier		=		"ImportLayerToolbarIdentifier",
    AnalyzeToolbarIdentifier				= 	"AnalyzeToolbarIdentifier",
    ExportToolbarIdentifier					=		"ExportToolbarIdentifier",
		HelpToolbarIdentifier						=		"HelpToolbarIdentifier";

@implementation FeaturesToolbarDelegate : CPObject {
}

- (CPArray)toolbarAllowedItemIdentifiers:(CPToolbar)aToolbar {
  	return [ImportLayerToolbarIdentifier, AnalyzeToolbarIdentifier, ExportToolbarIdentifier, HelpToolbarIdentifier];
	}

- (CPArray)toolbarDefaultItemIdentifiers:(CPToolbar)aToolbar {
   	return [ImportLayerToolbarIdentifier, AnalyzeToolbarIdentifier, ExportToolbarIdentifier, HelpToolbarIdentifier];
	}

- (CPToolbarItem)toolbar:(CPToolbar)aToolbar itemForItemIdentifier:(CPString)anItemIdentifier willBeInsertedIntoToolbar:(BOOL)aFlag {
		var toolbarItem = [[CPToolbarItem alloc] initWithItemIdentifier:anItemIdentifier];
		var mainBundle = [CPBundle mainBundle];

    if (anItemIdentifier === ImportLayerToolbarIdentifier) {
    	var image = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"import.png"] size:CPSizeMake(32, 32)];
    	var highlighted = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"importSelected.png"] size:CPSizeMake(32, 32)];
    	[toolbarItem setImage:image];
    	[toolbarItem setAlternateImage:highlighted];
			var featureGridController = [FeatureGridController sharedController];
			[toolbarItem setTarget:featureGridController];
			[toolbarItem setAction:@selector(openAddFilterWindow:)];
			[toolbarItem setLabel:@"Add Filter"];
    	[toolbarItem setMinSize:CGSizeMake(32, 32)];
    	[toolbarItem setMaxSize:CGSizeMake(32, 32)];

    }
    else if (anItemIdentifier === ExportToolbarIdentifier)
    {
    	var image = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"download.png"] size:CPSizeMake(32, 32)];
    	var highlighted = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"downloadSelected.png"] size:CPSizeMake(32, 32)];
    	[toolbarItem setImage:image];
			var featureGridController = [FeatureGridController sharedController];
			[toolbarItem setTarget:featureGridController];
			[toolbarItem setAction:@selector(showBufferWindow:)];
    	[toolbarItem setAlternateImage:highlighted];
    	[toolbarItem setLabel:@"Add Buffer"];
    	[toolbarItem setMinSize:CGSizeMake(32, 32)];
    	[toolbarItem setMaxSize:CGSizeMake(32, 32)];
    }
    else if (anItemIdentifier === AnalyzeToolbarIdentifier)
    {
    	var image = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"analyze.png"] size:CPSizeMake(32, 32)];
    	var highlighted = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"analyzeSelected.png"] size:CPSizeMake(32, 32)];
    	[toolbarItem setImage:image];
    	[toolbarItem setAlternateImage:highlighted];
			var featureGridController = [FeatureGridController sharedController];
			[toolbarItem setTarget:featureGridController];
			[toolbarItem setAction:@selector(newLayerFromFilters:)];
    	[toolbarItem setLabel:@"From Filter"];
    	[toolbarItem setMinSize:CGSizeMake(32, 32)];
    	[toolbarItem setMaxSize:CGSizeMake(32, 32)];
    }
		else if (anItemIdentifier === HelpToolbarIdentifier)
    {
    	var image = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"help.png"] size:CPSizeMake(32, 32)];
    	var highlighted = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"helpSelected.png"] size:CPSizeMake(32, 32)];
    	[toolbarItem setImage:image];
    	[toolbarItem setAlternateImage:highlighted];
 			var featureGridController = [FeatureGridController sharedController];
			[toolbarItem setTarget:featureGridController];
      [toolbarItem setAction:@selector(tableViewSelectionDidChange:)];
    	[toolbarItem setLabel:@"Map Feature"];
    	[toolbarItem setMinSize:CGSizeMake(32, 32)];
    	[toolbarItem setMaxSize:CGSizeMake(32, 32)];
    }
    
    return toolbarItem;
}

@end