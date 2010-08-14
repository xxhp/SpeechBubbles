
#import "DemoViewController.h"
#import "SpeechBubbleTableViewCell.h"
#import "Message.h"

@implementation DemoViewController

#pragma mark -
#pragma mark View Life Cycle

- (id)initWithCoder:(NSCoder*)decoder
{
	if ((self = [super initWithCoder:decoder]))
	{
		// Add items to our data model. Note that we don't calculate the size
		// of the bubble here yet.
		Message* message1 = [[Message alloc] init];
		message1.text = @"Hello there!";
		message1.bubbleType = kBubbleTypeLefthand;

		Message* message2 = [[Message alloc] init];
		message2.text = @"What's up?\nYou know, I had this weird dream last night.";
		message2.bubbleType = kBubbleTypeRighthand;

		Message* message3 = [[Message alloc] init];
		message3.text = @"I would tell you all about it, but now I...\n\n...forgot how it went.";
		message3.bubbleType = kBubbleTypeRighthand;

		messages = [[NSArray arrayWithObjects:message1, message2, message3, nil] retain];

		[message1 release];
		[message2 release];
		[message3 release];
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.tableView.backgroundColor = [UIColor colorWithRed:219/255.0 green:226/255.0 blue:237/255.0 alpha:1.0];
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	self.tableView.allowsSelection = NO;
	self.tableView.opaque = YES;

	// Initialize the SpeechBubble helper class and load its resources.
	[SpeechBubble loadResources];

	[self.tableView reloadData];
}

- (void)viewDidUnload
{
	// Unload the SpeechBubble resources here because we don't need them if
	// the view is not visible.
	[SpeechBubble freeResources];
}

- (void)dealloc
{
	[SpeechBubble freeResources];
	[messages release];
	[super dealloc];
}

#pragma mark -
#pragma mark UITableView DataSource

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
	return [messages count];
}

- (UITableViewCell*)tableView:(UITableView*)theTableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
	static NSString* kBubbleIdentifier = @"BubbleIdentifier";

	// Create or re-use a table view cell.
	SpeechBubbleTableViewCell* cell = (SpeechBubbleTableViewCell*)[theTableView dequeueReusableCellWithIdentifier:kBubbleIdentifier];
	if (cell == nil)
		cell = [[[SpeechBubbleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kBubbleIdentifier] autorelease];

	// Set the message text and the bubble properties on the cell.
	Message* message = [messages objectAtIndex:[indexPath row]];
	[cell setText:message.text bubbleSize:message.bubbleSize bubbleType:message.bubbleType];
	return cell;
}

#pragma mark -
#pragma mark UITableView Delegate

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
	// This function is called before cellForRowAtIndexPath, once for each cell.
	// We calculate the size and type of the speech bubble here and then cache 
	// it in the Message object, so we don't have to repeat those calculations 
	// every time we draw the cell.
	Message* message = [messages objectAtIndex:[indexPath row]];

	message.bubbleSize = [SpeechBubble getBubbleSizeForText:message.text bubbleType:message.bubbleType];

	return message.bubbleSize.height + 6;  // add 3px top and bottom margin
}

- (NSIndexPath*)tableView:(UITableView*)tableView willSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
	return nil;  // no selections
}

@end
