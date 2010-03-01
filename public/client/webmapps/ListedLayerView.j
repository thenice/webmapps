@import <AppKit/CPView.j>

@implementation ListedLayerView : CPView {
		int id;
    CPTextField name;
		CPCheckBox	isVisible;
}

- (void)setRepresentedObject:(id)anObject {    
    if (!name) {
				var mainBundle = [CPBundle mainBundle];
				var imagePath = [mainBundle pathForResource:@"layer.png"]; 
				layerImage = [[CPImage alloc] initWithContentsOfFile:imagePath size:CGSizeMake(32, 32)];
				imageView = [[CPImageView alloc] initWithFrame:CGRectMake(20,0,52,32)];
				[imageView setHasShadow:NO];
				[imageView setImageScaling:CPScaleNone];
				var imageSize = [layerImage size];
				[imageView setFrameSize:imageSize];
				[imageView setImage:layerImage];
				[self addSubview: imageView]; 	
				layersController  = [LayersController sharedLayersController];
				isVisible = [[CPCheckBox alloc] initWithFrame:CGRectMake(0, 8, 32, 40)];
				[isVisible setTag:[anObject id]];
				[isVisible setTarget:layersController];
				[isVisible setAction:@selector(layerWasChecked:)];
        name = [[CPTextField alloc] initWithFrame:CGRectMake (52, 8, 150, 25)];
        [name setFont:[CPFont systemFontOfSize:10.0]];
				[self setAutoresizingMask:CPViewWidthSizable];
        [self addSubview:name];
				[self addSubview:isVisible];
    }
        
    [name setStringValue:[anObject name]];
}

- (void)setSelected:(BOOL)isSelected
{
    [self setBackgroundColor:isSelected ? [CPColor colorWithHexString:"3d80df"] : nil];
    [name setTextColor:isSelected ? [CPColor whiteColor] : [CPColor blackColor]];
}

@end
