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


@end
