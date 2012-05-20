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

@implementation MessageProcessorImplTest {
	TGMessageProcessorImpl *messageProcessor;

	BOOL stopIndicatorCalled;
}

- (void)setUp {
	messageProcessor = [[TGMessageProcessorImpl alloc] autorelease];
	stopIndicatorCalled = NO;
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

- (void)testHelloMessageFromPartnerStopsIndicator {
	NSDictionary *rawMessage = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:nil]
			forKeys:[NSArray arrayWithObjects:nil]];
	TGMessage *const message = [TGMessage messageWithRawMessage:rawMessage];

	[messageProcessor processMessage:message];
	STAssertEquals(YES, stopIndicatorCalled, @"stopIndicator should be called for message with correct HELLO message");

}

- (void)tearDown {
	messageProcessor = NULL;
}

#pragma mark - TGWatingIndicatorController

- (void)stopIndicator {
	stopIndicatorCalled = YES;
}

@end
