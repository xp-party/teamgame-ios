//
//  PunisherViewController.m
//  Punisher
//
//  Created by Виталий on 22.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PunisherViewController.h"
#import "RequestSender.h"
#import "TGUserNameGenerator.h"

NSString *const HELLO_MESSAGE = @"Press the button, please. ^_^";

@implementation PunisherViewController {
@private
	id <GameCompletionMessenger> _gameOverMessenger;
	int myPlayerNumber;
}
@synthesize zeroButton;
@synthesize oneButton;
@synthesize debugLabel;

@synthesize theGame;
@synthesize gameOverMessenger = _gameOverMessenger;
@synthesize partnerResultLabel;
@synthesize requestSender = _requestSender;
@synthesize serverURLsGenerator = _serverURLsGenerator;
@synthesize spinner = _spinner;
@synthesize statusLabel = _statusLabel;
@synthesize userNameGenerator = _userNameGenerator;
@synthesize myNameLabel = _myNameLabel;
@synthesize partnersNameLabel = _partnersNameLabel;


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
	// Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	resultLabel.text = HELLO_MESSAGE;
	[self.theGame addObserver:self];
	myPlayerNumber = 0;
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
	[self.theGame removeObserver:self forKeyPath:STATE_PROPERTY];
	[debugLabel release];
	[theGame release];
	[zeroButton release];
	[oneButton release];
	[resultLabel release];
	[_gameOverMessenger release];
	[partnerResultLabel release], partnerResultLabel = nil;

	self.requestSender = nil;
	self.serverURLsGenerator = nil;
	self.spinner = nil;
	self.statusLabel = nil;
	self.userNameGenerator = nil;
	self.myNameLabel = nil;
	self.partnersNameLabel = nil;
	[super dealloc];
}


#pragma mark - MessageConsumer

- (BOOL)shouldSendEchoHelloMessageInResponeTo:(NSDictionary *)message fromPlayerWithId:(int) playerNumber {
	NSString *messageType = [message valueForKey:TYPE_PARAMETER_NAME];
	BOOL shouldSendEchoHelloMessage =
			(myPlayerNumber != 0)
			&&(playerNumber != myPlayerNumber)
			&& ([messageType isEqualToString:HELLO_MESSAGE_TYPE]);
	return shouldSendEchoHelloMessage;
}

- (void)consumeMessage:(NSDictionary *)message {
	NSLog(@"Punisher view contoller received message: %@", message);

	int playerNumber = [[message valueForKey:PLAYER_ID_PARAMETER_NAME] intValue];
	NSString *messageType = [message valueForKey:TYPE_PARAMETER_NAME];

	if (playerNumber != myPlayerNumber && myPlayerNumber != 0 && ([messageType isEqualToString:HELLO_MESSAGE_TYPE] || [messageType isEqualToString:ECHO_HELLO_MESSAGE_TYPE])) {
		NSString *partnerName = [message valueForKey:PLAYER_NAME_PARAMETER_NAME];
		self.partnersNameLabel.text = [NSString stringWithFormat:@"%@ (%d):", partnerName, playerNumber];
		[self.spinner stopAnimating];
	}


	if ([self shouldSendEchoHelloMessageInResponeTo:message fromPlayerWithId:playerNumber]) {
		[self.requestSender sayEchoHelloMessageFromPlayerWithId:myPlayerNumber andName:[self.userNameGenerator userName]];
	}
}

#pragma mark - Game Action

- (void)didSelectAnswer:(enum Answer)answer {
	NSString *stringWithAnswer = [[NSNumber numberWithInt:answer] description];
	NSLog(@"You clicked %@", stringWithAnswer);
	debugLabel.text = stringWithAnswer;
	[self.requestSender postMessage:debugLabel.text];
	[theGame chooseAnswer:answer];
}

- (IBAction)zeroButtonClicked {
	[self didSelectAnswer:ZERO];
}

- (IBAction)oneButtonClicked {
	[self didSelectAnswer:ONE];
}

- (IBAction)startGame {
	NSString *myName = [self.userNameGenerator userName];
	NSDictionary *teamInfo = [self.requestSender registerAndGetTeamInformation:myName];
	NSLog(@"Obtained teamInfo: \n%@", teamInfo);

	myPlayerNumber = [[teamInfo valueForKey:PLAYER_ID_PARAMETER_NAME] intValue];

	self.myNameLabel.text = [NSString stringWithFormat:@"%@ (%d):", myName, myPlayerNumber];

	[self.requestSender sayHelloMessageFromPlayerWithId:myPlayerNumber andName:[self.userNameGenerator userName]];

	[self.spinner startAnimating];
	self.statusLabel.text = @"ждём второго игрока";
}

@end
