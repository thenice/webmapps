@import <AppKit/CPCollectionView.j>

@implementation LayerListView : CPCollectionView {
	CPCollectionViewItem itemPrototype;
}

- (id)initWithFrame:(CGRect)aFrame {
	layerList = [CPCollectionView initWithFrame:aFrame];
	if (self) {
		
		[self setMinItemSize:CGSizeMake(250, 30)];
   	[self setMaxItemSize:CGSizeMake(250, 30)];
		itemPrototype = [[CPCollectionViewItem alloc] init];
   	[itemPrototype setView:[[ListedLayerView alloc] initWithFrame:CGRectMakeZero()]];
   	[self setItemPrototype:itemPrototype];
	}
	return self;
}

- (id)getCurrentObject {
   var content = [self items],
	 		 index = [self getSelectedIndex];
	return content[index];
}

- (int)getSelectedIndex {
	var selection = [self selectionIndexes];
  return [selection firstItem];
}

@end
