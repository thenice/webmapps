/*** Project.j **/
@import <Foundation/CPObject.j>

		
@implementation Project : CPObject
{
    CPString        id          				@accessors;
    CPString        title               @accessors;
    Date            createdAt           @accessors;
    Date            updatedAt           @accessors;
    BOOL						isLoaded						@accessors;			
}
 
- (id)initWithIdentifier:(int)anId
{
	self = [super init];
 
  	if (self)
  	{
    	id = anId;
        name = @"";
    }
    
    return self;
}


@end
