//
//  MessageProcessorImplTest.m
//  Punisher
//
//  Created by Vanger on 05/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MessageProcessorImplTest.h"

#import "TGMessageProcessorImpl.h"
#import "TGMessage.h"
#import "TGUserNameGenerator.h"

@implementation MessageProcessorImplTest {
	TGMessageProcessorImpl *messageProcessor;

	BOOL stopIndicatorCalled;

	int partnersNumber;
	NSString *partnersName;

	BOOL showReadyToPlayCalled;

	BOOL echoHelloSend;
}

- (void)setUp {
	messageProcessor = [[TGMessageProcessorImpl alloc] autorelease];
	messageProcessor.waitingIndicator = self;
	messageProcessor.gameController = self;
	messageProcessor.viewDataController = self;
	messageProcessor.requestSender = self;

	TGUserNameGenerator *const nameGenerator = [TGUserNameGenerator alloc];
	messageProcessor.userNameGenerator = nameGenerator;
	[nameGenerator release];

	stopIndicatorCalled = NO;
	showReadyToPlayCalled = NO;
	partnersNumber = 0;
	partnersName = NULL;
}

- (TGMessage *)emptyMessage {
	return [[TGMessage alloc] autorelease];
}

- (void)testEmptyMessageDoesntRiseError {
	[messageProcessor processMessage:[self emptyMessage]];
}

- (void)testEmptyMessageDoesntStopIndicator {
	[messageProcessor processMessage:[self emptyMessage]];
	STAssertEquals(NO, stopIndicatorCalled, @"stopIndicator shouldn't be called for empty message");
}

- (void)testHelloMessageFromPartnerStopsIndicatorAndSetPartnersNameAndNumber {
	const int fakePartnerNumber = 5;
	NSString *const fakePartnerName = @"some player name";
	NSArray *const objects = [NSArray arrayWithObjects:[NSNumber numberWithInt:fakePartnerNumber], HELLO_MESSAGE_TYPE, fakePartnerName, nil];
	NSArray *const keys = [NSArray arrayWithObjects:PLAYER_ID_PARAMETER_NAME, TYPE_PARAMETER_NAME, PLAYER_NAME_PARAMETER_NAME, nil];
	NSDictionary *rawMessage = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	TGMessage *const message = [TGMessage messageWithRawMessage:rawMessage];

	[messageProcessor processMessage:message];

	STAssertEquals(stopIndicatorCalled, YES, @"stopIndicator should be called for message with correct HELLO message from partner");
	STAssertEquals(partnersNumber, fakePartnerNumber, @"partners number should be defined after correct HELLO message from partner");
	STAssertEqualObjects(partnersName, fakePartnerName, @"partners name should be defined after correct HELLO message from partner");
}

- (void)testHelloMessageFromPartnerSendsEchoHelloAndShowReadyToPlay {
	const int fakePartnerNumber = 5;
	NSString *const fakePartnerName = @"some player name";
	NSArray *const objects = [NSArray arrayWithObjects:[NSNumber numberWithInt:fakePartnerNumber], HELLO_MESSAGE_TYPE, fakePartnerName, nil];
	NSArray *const keys = [NSArray arrayWithObjects:PLAYER_ID_PARAMETER_NAME, TYPE_PARAMETER_NAME, PLAYER_NAME_PARAMETER_NAME, nil];
	NSDictionary *rawMessage = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	TGMessage *const message = [TGMessage messageWithRawMessage:rawMessage];

	[messageProcessor processMessage:message];

	STAssertEquals(showReadyToPlayCalled, YES, @"showReadyToPlay should be called for message with correct HELLO message from partner");
	STAssertEquals(echoHelloSend, YES, @"EchoHello should be send after correct HELLO message from partner");
}

- (void)tearDown {
	messageProcessor = NULL;
	partnersName = NULL;
}

#pragma mark - TGWatingIndicatorController

- (void)stopIndicator {
	stopIndicatorCalled = YES;
}

#pragma mark - TGGameController

- (int)myPlayerNumber {
	return 2;
}

#pragma mark - TGViewDataController

- (void)showPlayerNumber:(int)playerNumber name:(NSString *)playerName {
	partnersNumber = playerNumber;
	partnersName = playerName;
}

- (void)showReadyToPlay {
	showReadyToPlayCalled = YES;
}

- (NSString *)postMessage:(NSString *)message {
	return nil;
}

- (NSDictionary *)registerAndGetTeamInformation:(NSString *)userName {
	return nil;
}

- (void)sayHelloMessageFromPlayerWithId:(int)playerNumber andName:(NSString *)playerName {
}

- (void)sayEchoHelloMessageFromPlayerWithId:(int)playerNumber andName:(NSString *)playerName {
	echoHelloSend = YES;
}


@end
