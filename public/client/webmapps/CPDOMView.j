@import <AppKit/CPView.j>

var CPDOMViewCount = 0;

@implementation CPDOMView : CPView
{
}

- (id)initWithFrame:(CGRect)aFrame
{
    if (self = [super initWithFrame:aFrame])
    {
        _DOMElement.setAttribute("id", "CPDOMView"+(CPDOMViewCount++));
    }
    return self;
}

- (Element)DOMElement
{
    return _DOMElement;
}

- (CPString)DOMElementID
{
    return _DOMElement.id;
}

- (void)mouseDragged:(CPEvent)anEvent
{
    [[[self window] platformWindow] _propagateCurrentDOMEvent:YES];
}

- (void)mouseMoved:(CPEvent)anEvent
{
    [[[self window] platformWindow] _propagateCurrentDOMEvent:YES];
}

- (void)mouseDown:(CPEvent)anEvent
{
    [[[self window] platformWindow] _propagateCurrentDOMEvent:YES];
}

- (void)mouseUp:(CPEvent)anEvent
{
    [[[self window] platformWindow] _propagateCurrentDOMEvent:YES];
}

@end