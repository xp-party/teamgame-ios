//
//  PunisherViewController.m
//  Punisher
//
//  Created by Виталий on 22.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PunisherViewController.h"
#import "RequestSender.h"
#import "WebSocketListener.h"

NSString *const HELLO_MESSAGE = @"Press the button, please. ^_^";

@implementation PunisherViewController {
@private
	id <GameCompletionMessenger> _gameOverMessenger;
	WebSocketListener *_webSocketListener;
}
@synthesize zeroButton;
@synthesize oneButton;
@synthesize debugLabel;

@synthesize theGame;
@synthesize gameOverMessenger = _gameOverMessenger;
@synthesize partnerResultLabel;
@synthesize listeningWebSocket = _listeningWebSocket;
@synthesize requestSender = _requestSender;


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
	// Release any cached data, images, etc that aren't in use.
}

#pragma mark - Realization

- (IBAction)zeroButtonClicked {
	NSLog(@"You clicked 0");
	debugLabel.text = @"0";
	[self.requestSender sendRequest:debugLabel.text];
	[theGame chooseAnswer:ZERO];
}

- (IBAction)oneButtonClicked {
	NSLog(@"You clicked 1");
	debugLabel.text = @"1";
	[self.requestSender sendRequest:debugLabel.text];
	[theGame chooseAnswer:ONE];
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	resultLabel.text = HELLO_MESSAGE;
	[self.theGame addObserver:self];

	_webSocketListener = [[WebSocketListener alloc] initWithMessageConsumer:self];
	_listeningWebSocket = [[ZTWebSocket alloc] initWithURLString:@"ws://localhost:9000/socket/listen"
														delegate:_webSocketListener];
	[self.listeningWebSocket open];

	[self.requestSender sendRequest:@"giveAnyTeam"];
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
	[_webSocketListener release], _webSocketListener = nil;

	self.requestSender = nil;
	[super dealloc];
}


#pragma mark - MessageConsumer

- (void)consumeMessage:(NSString *)message {
	NSLog(@"Punisher view contoller received message: %@", message);
}

@end
