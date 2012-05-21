//
//  MessageTest.m
//  Punisher
//
//  Created by Vanger on 05/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TGMessageTest.h"
#import "TGMessage.h"

@implementation TGMessageTest

- (void)testExtractingOfPlayerNumberIsCorrect {
	const int playerNumber = 5;
	NSDictionary *rawMessage = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:playerNumber] forKey:PLAYER_ID_PARAMETER_NAME];

	TGMessage *message = [TGMessage messageWithRawMessage:rawMessage];
	STAssertEquals(message.playerNumber, playerNumber, @"player number extracted from raw message incorrectly");
}

- (void)testExtractingOfMessageTypeCorrect {
	NSString *const type = @"testType";
	NSDictionary *rawMessage = [NSDictionary dictionaryWithObject:type forKey:TYPE_PARAMETER_NAME];

	TGMessage *message = [TGMessage messageWithRawMessage:rawMessage];
	STAssertEqualObjects(message.messageType, type, @"message type extracted from raw message incorrectly");
}

- (void)testExtractingOfPlayerNameCorrect {
	NSString *const type = @"player name";
	NSDictionary *rawMessage = [NSDictionary dictionaryWithObject:type forKey:PLAYER_NAME_PARAMETER_NAME];

	TGMessage *message = [TGMessage messageWithRawMessage:rawMessage];
	STAssertEqualObjects(message.fromPlayerName, type, @"player name extracted from raw message incorrectly");
}

- (void)testNonHelloMessageReturnsNo {
	NSDictionary *rawMessage = [NSDictionary dictionaryWithObject:ECHO_HELLO_MESSAGE_TYPE forKey:TYPE_PARAMETER_NAME];

	TGMessage *message = [TGMessage messageWithRawMessage:rawMessage];
	STAssertEquals([message isHelloMessageFromPlayerWithNumberOtherThan:0], NO, @"for non HELLO message should return NO on isHelloMessageFromPlayerWithNumberOtherThan request");
}

- (void)testHelloMessageFromOtherPlayerfReturnsYes {
	const int fromMessageNumber = 1;
	NSArray *const objects = [NSArray arrayWithObjects:[NSNumber numberWithInt:fromMessageNumber], HELLO_MESSAGE_TYPE, nil];
	NSArray *const keys = [NSArray arrayWithObjects:PLAYER_ID_PARAMETER_NAME, TYPE_PARAMETER_NAME, nil];
	NSDictionary *rawMessage = [NSDictionary dictionaryWithObjects:objects forKeys:keys];

	TGMessage *message = [TGMessage messageWithRawMessage:rawMessage];
	STAssertEquals([message isHelloMessageFromPlayerWithNumberOtherThan:0], YES, @"for HELLO message from other player should return YES on isHelloMessageFromPlayerWithNumberOtherThan request");
}

- (void)testHelloMessageFromMySelfReturnsNo {
	const int myNumber = 1;
	NSArray *const objects = [NSArray arrayWithObjects:[NSNumber numberWithInt:myNumber], HELLO_MESSAGE_TYPE, nil];
	NSArray *const keys = [NSArray arrayWithObjects:PLAYER_ID_PARAMETER_NAME, TYPE_PARAMETER_NAME, nil];
	NSDictionary *rawMessage = [NSDictionary dictionaryWithObjects:objects forKeys:keys];

	TGMessage *message = [TGMessage messageWithRawMessage:rawMessage];
	STAssertEquals([message isHelloMessageFromPlayerWithNumberOtherThan:myNumber], NO, @"for HELLO message from myself should return NO on isHelloMessageFromPlayerWithNumberOtherThan request");
}

@end
