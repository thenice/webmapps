@import <Foundation/CPObject.j>

@implementation AddFilterDelegate : CPObject {
}

- (void)connection:(CPURLConnection)aConnection didReceiveData:(CPString)theData
{
		featureGridController = [FeatureGridController sharedController];
		theLayer = [featureGridController layer];
		newLayer = [[Layer alloc] initWithIdentifier:[theLayer id]];
		[featureGridController setLayer:newLayer];
		[[featureGridController _filterWindow] close];
		//[featureGridController verticalShift:-40];
}


@end