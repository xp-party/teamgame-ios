//
//  PunisherViewController.m
//  Punisher
//
//  Created by Виталий on 22.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PunisherViewController.h"
#import "WebSocketMessageConsumer.h"
#import "ZTWebSocketDelegateImpl.h"

NSString *const HELLO_MESSAGE = @"Press the button, please. ^_^";

@implementation PunisherViewController {
@private
    id <GameCompletionMessenger> _gameOverMessenger;
	id <ZTWebSocketDelegate> _listeningDelegate;
}
@synthesize zeroButton;
@synthesize oneButton;
@synthesize debugLabel;

@synthesize theGame;
@synthesize gameOverMessenger = _gameOverMessenger;
@synthesize partnerResultLabel;
@synthesize listeningWebSocket = _listeningWebSocket;


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Realization

- (void)postMessage:(NSString *)message {
	NSURL *postURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.1.2:9000/socket/post?message=%@", message]];
	NSError **error = nil;
	[NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:postURL] returningResponse:nil error:error];
	if (error) {
		NSLog(@"Error occured: %@", *error);
	}

//	id<ZTWebSocketDelegate> postingDelegate = [ZTWebSocketDelegateImpl alloc];
//	ZTWebSocket *postingSocket = [[ZTWebSocket alloc] initWithURLString:@"ws://192.168.1.2:9000/socket/post" delegate:postingDelegate];
//	[postingSocket open];
//	[postingSocket send:message];
//	[postingSocket close];
//	[postingDelegate release];
}

- (IBAction)zeroButtonClicked {
    NSLog(@"You clicked 0");
    debugLabel.text = @"0";
	[self postMessage:debugLabel.text];
    [theGame chooseAnswer:ZERO];
}

- (IBAction)oneButtonClicked {
    NSLog(@"You clicked 1");
    debugLabel.text = @"1";
	[self postMessage:debugLabel.text];
	[theGame chooseAnswer:ONE];
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    resultLabel.text = HELLO_MESSAGE;
    [self.theGame addObserver:self];

	_listeningDelegate = [[ZTWebSocketDelegateImpl alloc] init];
	_listeningWebSocket = [[ZTWebSocket alloc] initWithURLString:@"ws://192.168.1.2:9000/socket/listen"
															 delegate:_listeningDelegate];
	[self.listeningWebSocket open];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return ((interfaceOrientation == UIInterfaceOrientationPortrait) ||
            (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown));
}


#pragma mark - K-V Observing
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
//    if (self.theGame.state == WIN) {
//        self->resultLabel.text = @"Win";
//    } else if (self.theGame.state == LOSE) {
//        self.resultLabel.text = @"Loose";
//    }

	self.partnerResultLabel.text = [NSString stringWithFormat:@"%d", theGame.partnersAnswer];
	[_gameOverMessenger showGameOver:theGame.state];
	[theGame emulateAnswer];
}

- (void)dealloc {
	[self.theGame removeObserver:self forKeyPath:STATE_PROPERTY context:nil];
	[debugLabel release];
	[theGame release];
	[zeroButton release];
	[oneButton release];
	[resultLabel release];
	[_gameOverMessenger release];
	[partnerResultLabel release], partnerResultLabel = nil;

	[_listeningWebSocket close];
	[_listeningWebSocket release], _listeningWebSocket = nil;
	[_listeningDelegate release], _listeningDelegate = nil;

	[super dealloc];
}
@end
