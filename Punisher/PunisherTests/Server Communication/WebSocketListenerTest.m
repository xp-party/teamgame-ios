//
//  WebSocketListenerTest.m
//  Punisher
//
//  Created by Vanger on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "WebSocketListenerTest.h"
#import "FakeEventPublisher.h"
#import "WebSocketListener.h"

@implementation WebSocketListenerTest

@synthesize receivedMessage = _receivedMessage;

- (void)test_receiving_of_published_message {
	WebSocketListener *listener = [[WebSocketListener alloc] initWithMessageConsumer:self];
	FakeEventPublisher *fakePublisher = [[FakeEventPublisher alloc] initWithListner:listener];

	NSString *message = @"some message";
	[fakePublisher publish:message];
	STAssertEqualObjects(self.receivedMessage, message, @"Doesn't receive published message");
	[fakePublisher release];
	[listener release];
}

- (void)consumeMessage:(NSString *)message {
	self.receivedMessage = message;
}

@end
