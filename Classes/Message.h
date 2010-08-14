
#import "SpeechBubble.h"

// This is a very simple data model. Each speech bubble represents a Message
// object. We cache the bubble type and size with the Message, so we only have
// to calculate that information once.
@interface Message : NSObject
{
	NSString* text;	
	BubbleType bubbleType;
	CGSize bubbleSize;
}

@property (nonatomic, retain) NSString* text;
@property (nonatomic, assign) BubbleType bubbleType;
@property (nonatomic, assign) CGSize bubbleSize;

@end
