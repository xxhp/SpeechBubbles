/*!
 * \file SpeechBubbleView.h
 */

#import "SpeechBubble.h"

/*!
 * A UIView that draws a speech bubble.
 */
@interface SpeechBubbleView : UIView
{
	NSString* text;         ///< the text inside the bubble
	CGSize bubbleSize;      ///< the dimensions of the bubble
	BubbleType bubbleType;  ///< the type of the bubble
}

/*!
 * Sets the properties of the speech bubble.
 *
 * You need to make sure that the view is big enough to fit the bubble, i.e.
 * the SpeechBubbleView will not automatically size itself.
 *
 * @param text the text inside the bubble
 * @param bubbleSize the dimensions of the bubble
 * @param bubbleType the type of the bubble (left-hand or right-hand)
 */
- (void)setText:(NSString*)text bubbleSize:(CGSize)bubbleSize bubbleType:(BubbleType)bubbleType;

@end
