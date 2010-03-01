
@implementation FeatureView : CPView {
  CPWindow          _theWindow        @accessors;
  CPView            _contentView      @accessors;
  String            _windowTitle      @accessors;
  CGRect            _windowBounds     @accessors;
  CPCollectionView  _filterList       @accessors;   
  CPArray           _filters          @accessors;
  CPTableView       _tableView        @accessors; 
}

- (id)init:(String)aTitle {
	_theWindow = [[CPWindow alloc] initWithContentRect:CGRectMake(50.0, 50.0, 400.0, 400.0) styleMask:CPTitledWindowMask | CPClosableWindowMask | CPResizableWindowMask];
	_contentView = [_theWindow contentView];
  _bounds = [contentView bounds];
	[_featuresWindow setTitle:@"Feature View:  " + _windowTitle];
}

- (void)closeMainWindow
{
	[_theWindow close];
}

- (void)showMainWindow
{
	
}

- (void)createTable()
{
	
}

- (void)refreshData
{
	
}

- (void)showFilterWindow
{
	
}

- (void)filterHasBeenAdded
{
	
}

- (void)filterHasBeenRemoved
{
	
}

- (void)closeFilterWindow
{
	
}

-(void)showToolbar
{
	
}

- (void)createFilterList 
{
	
}

-(void)refreshFilterList
{
	
}


@end

// delegates

@implementation ToolbarDelegate
@end

@implementation RemoveFilterResponseDelegate
@end

@implementation AddFilterResponseDelegate
@end

