
#import "SpeechBubbleView.h"

@implementation SpeechBubbleView

- (void)drawRect:(CGRect)rect
{
	[[UIColor colorWithRed:219/255.0 green:226/255.0 blue:237/255.0 alpha:1.0] setFill];
	UIRectFill(rect);

	CGPoint point = CGPointMake(3, 3);  // insets

	if (bubbleType == kBubbleTypeRighthand)
		point.x = self.bounds.size.width - bubbleSize.width - 3;

	[SpeechBubble drawBubbleWithText:text atPoint:point bubbleSize:bubbleSize bubbleType:bubbleType];
}

- (void)setText:(NSString*)text_ bubbleSize:(CGSize)bubbleSize_ bubbleType:(BubbleType)bubbleType_
{
	if (text != nil)
		[text release];
		
	text = [text_ retain];
	bubbleSize = bubbleSize_;
	bubbleType = bubbleType_;
	[self setNeedsDisplay];
}

- (void)dealloc
{
	[text release];
	[super dealloc];
}

@end
