/*!
 * \file SpeechBubble.h
 */

/*!
 * The bubble type indicates whether it's a left-hand or right-hand bubble.
 */
typedef enum
{
	kBubbleTypeLefthand = 0,
	kBubbleTypeRighthand,
}
BubbleType;

/*!
 * Helper class for calculating the size of speech bubbles and drawing them.
 *
 * \note This is not itself a UIView
 */
@interface SpeechBubble : NSObject
{
}

/*!
 * Call this before using any of the other methods from SpeechBubble.
 */
+ (void)loadResources;

/*!
 * Call this to unload the images and fonts used by SpeechBubble.
 */
+ (void)freeResources;

/*!
 * Calculates the size of a speech bubble.
 *
 * @param text the text to draw inside the bubble
 * @param type the type of the bubble
 */
+ (CGSize)getBubbleSizeForText:(NSString*)text bubbleType:(BubbleType)type;

/*!
 * Draws a speech bubble in the current graphics context.
 *
 * @param text the text to draw inside the bubble
 * @param point where to draw the bubble
 * @param size the dimensions of the bubble
 * @param type the type of the bubble
 */
+ (void)drawBubbleWithText:(NSString*)text atPoint:(CGPoint)point bubbleSize:(CGSize)size bubbleType:(BubbleType)type;

@end
