@import <AppKit/CPColorPanel.j>

@implementation ColorSwatchView : CPView
{
	CPColor					color					@accessor;
	CPColorPanel		colorPicker		@accessor;
}
	
- (id)initWithFrame:(CGRect)aFrame startColor:(CPColor)aColor
{
	self = [super initWithFrame:aFrame];
	[self setBackgroundColor: aColor];
	colorPicker = [CPColorPanel sharedColorPanel];
	[colorPicker setTarget: self];
	[colorPicker setAction: @selector(updateSwatch:)];
	return self;
}

- (void)mouseDown:(CPEvent)anEvent
{
	[colorPicker orderFront:self];
}

- (@action)updateSwatch:(id)aSender
{
	alert([aSender tag]);
}

@end

