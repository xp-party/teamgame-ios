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
#import "TGMessage.h"
#import "TGMessageProcessor.h"

NSString *const HELLO_MESSAGE = @"Press the button, please. ^_^";

@implementation PunisherViewController {
@private
	id <GameCompletionMessenger> _gameOverMessenger;
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
@synthesize myPlayerNumber = _myPlayerNumber;
@synthesize messageProcessor = _messageProcessor;


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
	self.myPlayerNumber = 0;
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
	self.messageProcessor = nil;
	[super dealloc];
}

#pragma mark - MessageConsumer

- (BOOL)shouldSendEchoHelloMessageInResponeTo:(TGMessage *)message fromPlayerWithId:(int)playerNumber {
	NSString *messageType = message.messageType;
	const int myNumber = self.myPlayerNumber;
	BOOL shouldSendEchoHelloMessage =
			(myNumber != 0)
					&& (playerNumber != myNumber)
					&& ([messageType isEqualToString:HELLO_MESSAGE_TYPE]);
	return shouldSendEchoHelloMessage;
}

- (void)processMessage:(TGMessage *)message {
	int playerNumber = message.playerNumber;
	NSString *messageType = message.messageType;

	const int myNumber = self.myPlayerNumber;
	const BOOL isHelloMessageFromPartner = playerNumber != myNumber && myNumber != 0
			&& ([messageType isEqualToString:HELLO_MESSAGE_TYPE] || [messageType isEqualToString:ECHO_HELLO_MESSAGE_TYPE]);

	if (isHelloMessageFromPartner) {
		NSString *partnerName = message.fromPlayerName;
		[self showPlayerNumber:playerNumber name:partnerName];
		[self stopIndicator];
	}

	const BOOL shouldSendEchoHelloMEssage = [self shouldSendEchoHelloMessageInResponeTo:message fromPlayerWithId:playerNumber];
	if (shouldSendEchoHelloMEssage) {
		[self.requestSender sayEchoHelloMessageFromPlayerWithId:myNumber andName:[self.userNameGenerator userName]];
		[self showReadyToPlay];
	}
}

//TODO: test it %(
- (void)consumeMessage:(NSDictionary *)rawMessage {
	NSLog(@"Punisher view contoller received message: %@", rawMessage);

	TGMessage *message = [TGMessage messageWithRawMessage:rawMessage];

	[self.messageProcessor processMessage:message];
	[self processMessage:message];
	[message release];
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

//TODO: Test IT!!
- (IBAction)startGame {
	NSString *myName = [self.userNameGenerator userName];
	NSDictionary *teamInfo = [self.requestSender registerAndGetTeamInformation:myName];
	NSLog(@"Obtained teamInfo: \n%@", teamInfo);

	self.myPlayerNumber = [[teamInfo valueForKey:PLAYER_ID_PARAMETER_NAME] intValue];

	self.myNameLabel.text = [NSString stringWithFormat:@"%@ (%d):", myName, self.myPlayerNumber];

	[self.spinner startAnimating];
	self.statusLabel.text = @"ждём второго игрока";

	[self.requestSender sayHelloMessageFromPlayerWithId:self.myPlayerNumber andName:[self.userNameGenerator userName]];
}

#pragma mark - TGWatingIndicatorDelegate

- (void)stopIndicator {
	[self.spinner stopAnimating];
}

#pragma mark - TGViewDataController

- (void)showPlayerNumber:(int)playerNumber name:(NSString *)playerName {
	self.partnersNameLabel.text = [NSString stringWithFormat:@"%@ (%d):", playerName, playerNumber];
}

- (void)showReadyToPlay {
	self.statusLabel.text = @"готовы играть!";
}

@end
