
#import "SpeechBubble.h"

typedef struct 
{
	UIImage* image;
	int textLeftMargin;  // for the text box
	int textRightMargin;
	int textTopMargin;
	int textBottomMargin;
}
BubbleInfo;

static UIFont* font;
static BubbleInfo lefthandBubbleInfo;
static BubbleInfo righthandBubbleInfo;

const CGFloat kMinBubbleWidth  = 50;  // minimum width of the bubble
const CGFloat kMinBubbleHeight = 40;  // minimum height of the bubble
const CGFloat kWrapWidth = 200;       // maximum width of text in the bubble

@implementation SpeechBubble

+ (void)loadResources
{
	font = [[UIFont systemFontOfSize:[UIFont systemFontSize]] retain];

	lefthandBubbleInfo.image = [[[UIImage imageNamed:@"BubbleLefthand.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:19] retain];

	lefthandBubbleInfo.textLeftMargin   = 17;
	lefthandBubbleInfo.textRightMargin  = 15;
	lefthandBubbleInfo.textTopMargin    = 10;
	lefthandBubbleInfo.textBottomMargin = 11;

	righthandBubbleInfo.image = [[[UIImage imageNamed:@"BubbleRighthand.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:19] retain];

	righthandBubbleInfo.textLeftMargin   = 15;
	righthandBubbleInfo.textRightMargin  = 17;
	righthandBubbleInfo.textTopMargin    = 10;
	righthandBubbleInfo.textBottomMargin = 11;
}

+ (void)freeResources
{
	[lefthandBubbleInfo.image release];
	[righthandBubbleInfo.image release];
	[font release];
}

+ (CGSize)getBubbleSizeForText:(NSString*)text bubbleType:(BubbleType)type
{
	CGSize textSize = [text sizeWithFont:font constrainedToSize:CGSizeMake(kWrapWidth, 9999) lineBreakMode:UILineBreakModeWordWrap];

	BubbleInfo* info;
	if (type == kBubbleTypeLefthand)
		info = &lefthandBubbleInfo;
	else
		info = &righthandBubbleInfo;

	CGSize bubbleSize;
	bubbleSize.width  = textSize.width  + info->textLeftMargin + info->textRightMargin;
	bubbleSize.height = textSize.height + info->textTopMargin  + info->textBottomMargin;

	if (bubbleSize.width < kMinBubbleWidth)
		bubbleSize.width = kMinBubbleWidth;

	if (bubbleSize.height < kMinBubbleHeight)
		bubbleSize.height = kMinBubbleHeight;

	return bubbleSize;
}

+ (void)drawBubbleWithText:(NSString*)text atPoint:(CGPoint)point bubbleSize:(CGSize)size bubbleType:(BubbleType)type
{
	BubbleInfo* info;
	if (type == kBubbleTypeLefthand)
		info = &lefthandBubbleInfo;
	else
		info = &righthandBubbleInfo;

	CGRect rect;
	rect.origin = point;
	rect.size = size;

	// debug graphics (bubble rectangle)
	/*
	[[UIColor blueColor] setFill];
	UIRectFill(rect);
	*/

	[info->image drawInRect:rect];

	CGRect textRect;
	textRect.origin.x = point.x + info->textLeftMargin;
	textRect.origin.y = point.y + info->textTopMargin;
	textRect.size.width = size.width - info->textLeftMargin - info->textRightMargin;
	textRect.size.height = size.height - info->textTopMargin - info->textBottomMargin;

	// debug graphics (text rectangle)
	/*
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetLineWidth(context, 0.5);
	CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
	CGContextAddRect(context, textRect);
	CGContextDrawPath(context, kCGPathStroke);
	*/

	[[UIColor blackColor] set];
	[text drawInRect:textRect withFont:font lineBreakMode:UILineBreakModeWordWrap];
}

@end
