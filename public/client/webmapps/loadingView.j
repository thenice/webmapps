
@implementation LoadingView : CPView {
	CPView      loadingView;
}

- (id)initWithFrame:(CGRect)aFrame {
	loadingView = [CPView initWithFrame:aFrame];
	[loadingView setBackgroundColor: [CPColor greyColor]];
	return self;
}


@end
