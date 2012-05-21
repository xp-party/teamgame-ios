//
// Created by vanger on 20.05.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "TGMessageProcessorImpl.h"
#import "TGMessage.h"
#import "TGGameController.h"
#import "TGViewDataController.h"
#import "TGWatingIndicatorController.h"

#import "RequestSender.h"
#import "TGUserNameGenerator.h"


@implementation TGMessageProcessorImpl {

}
@synthesize waitingIndicator = _waitingIndicator;
@synthesize gameController = _gameController;
@synthesize viewDataController = _viewDataController;
@synthesize requestSender = _requestSender;
@synthesize userNameGenerator = _userNameGenerator;


- (BOOL)shouldSendEchoHelloMessageInResponeTo:(TGMessage *)message fromPlayerWithId:(int)playerNumber {
	NSString *messageType = message.messageType;
	const int myNumber = [self.gameController myPlayerNumber];
	BOOL shouldSendEchoHelloMessage =
			(myNumber != 0)
					&& (playerNumber != myNumber)
					&& ([messageType isEqualToString:HELLO_MESSAGE_TYPE]);
	return shouldSendEchoHelloMessage;
}

- (void)processMessage:(TGMessage *)message {
	int playerNumber = message.playerNumber;
	NSString *messageType = message.messageType;

	const int myNumber = self.gameController.myPlayerNumber;
	const BOOL isHelloMessageFromPartner = playerNumber != myNumber && myNumber != 0
			&& ([messageType isEqualToString:HELLO_MESSAGE_TYPE] || [messageType isEqualToString:ECHO_HELLO_MESSAGE_TYPE]);

	if (isHelloMessageFromPartner) {
		NSString *partnerName = message.fromPlayerName;
		[self.viewDataController showPlayerNumber:playerNumber name:partnerName];
		[self.waitingIndicator stopIndicator];
	}

	const BOOL shouldSendEchoHelloMEssage = [self shouldSendEchoHelloMessageInResponeTo:message fromPlayerWithId:playerNumber];
	if (shouldSendEchoHelloMEssage) {
		[self.requestSender sayEchoHelloMessageFromPlayerWithId:myNumber andName:[self.userNameGenerator userName]];
		[self.viewDataController showReadyToPlay];
	}
}

- (void)dealloc {
	self.waitingIndicator = nil;
	self.gameController = nil;
	self.viewDataController = nil;
	self.requestSender = nil;
	self.userNameGenerator = nil;
	[super dealloc];
}


@end