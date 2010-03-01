@import <AppKit/CPView.j>

@implementation ListedProjectView : CPView {
		int id;
    CPTextField title;
}

- (void)setRepresentedObject:(id)anObject {    
    if (!title) {
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
        title = [[CPTextField alloc] initWithFrame:CGRectMake (52, 8, 150, 25)];
        [title setFont:[CPFont systemFontOfSize:10.0]];
				[self setAutoresizingMask:CPViewWidthSizable];
        [self addSubview:title];
    }
        
    [title setStringValue:[anObject title]];
}

- (void)setSelected:(BOOL)isSelected
{
    [self setBackgroundColor:isSelected ? [CPColor colorWithHexString:"3d80df"] : nil];
    [title setTextColor:isSelected ? [CPColor whiteColor] : [CPColor blackColor]];
}

@end
