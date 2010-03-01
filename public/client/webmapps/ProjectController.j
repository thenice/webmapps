@import <Foundation/CPObject.j>

var sharedProjectController = nil;

@implementation ProjectController : CPObject
{
	
}

+ (ProjectController)sharedController
{
	if(!sharedProjectController)
		sharedProjectController = [[ProjectController alloc] init];
	return sharedProjectController;
}

- (void)refreshLayers
{
	[Layer refreshLayers];
}

-(void)switchProject:(Project)aProject
{
	projectId = aProject.id;
	projectTitle = aProject.title;
	[CPMenu setMenuBarTitle: aProject.title];
	[Layer refreshLayers];
}



- (void)openProject
{
	
}

@end