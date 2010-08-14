/*!
 * \file SpeechBubbleTableViewCell.h
 */

#import "SpeechBubbleView.h"

/*!
 * Lets you use a speech bubble inside a table view.
 */
@interface SpeechBubbleTableViewCell : UITableViewCell
{
	SpeechBubbleView* bubbleView;  ///< the view that does the actual drawing
}

/*!
 * Sets the properties of the speech bubble.
 *
 * You should calculate the size of the bubble in tableView:heightForRowAtIndexPath:
 * and pass that size along when you configure the table view cell.
 *
 * @param text the text inside the bubble
 * @param bubbleSize the dimensions of the bubble
 * @param bubbleType the type of the bubble (left-hand or right-hand)
 */
- (void)setText:(NSString*)text bubbleSize:(CGSize)bubbleSize bubbleType:(BubbleType)bubbleType;

@end
