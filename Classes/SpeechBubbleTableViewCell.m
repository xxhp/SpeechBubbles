
#import "SpeechBubbleTableViewCell.h"

@implementation SpeechBubbleTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier
{
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
	{
		self.selectionStyle = UITableViewCellSelectionStyleNone;

		bubbleView = [[SpeechBubbleView alloc] initWithFrame:self.contentView.bounds];
		bubbleView.opaque = YES;
		bubbleView.clearsContextBeforeDrawing = NO;
		bubbleView.contentMode = UIViewContentModeRedraw;
		bubbleView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

		[self.contentView addSubview:bubbleView];
	}
	return self;
}

- (void)dealloc
{
	[bubbleView release];
	[super dealloc];
}

- (void)setText:(NSString*)text bubbleSize:(CGSize)bubbleSize bubbleType:(BubbleType)bubbleType
{
	[bubbleView setText:text bubbleSize:bubbleSize bubbleType:bubbleType];
}

@end
