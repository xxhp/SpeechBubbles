
#import "Message.h"

@implementation Message

@synthesize text;
@synthesize bubbleType;
@synthesize bubbleSize;

- (void)dealloc
{
	[text release];
	[super dealloc];
}

@end
