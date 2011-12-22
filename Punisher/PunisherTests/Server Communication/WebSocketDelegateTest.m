//
//  WebSocketListenerTest.m
//  Punisher
//
//  Created by Vanger on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "WebSocketDelegateTest.h"
#import "WebSocketDelegateImpl.h"

@implementation WebSocketDelegateTest

@synthesize receivedDictionary = _receivedDictionary;

- (void)test_Should_Receive_Message_From_Web_Socket_Delegate_When_Come_Message_From_Web_Socket {
    WebSocketDelegateImpl *listener = [[[WebSocketDelegateImpl alloc] initWithMessageConsumer:self] autorelease];
	NSString *originalMessage = @"some message";
	NSString *fieldName = @"msg";
	NSString *jsonMessage = [NSString stringWithFormat:@"{\"%@\": \"%@\"}", fieldName, originalMessage];
	[listener webSocket:NULL didReceiveMessage:jsonMessage];

	NSString *receivedMessage = [self.receivedDictionary valueForKey:fieldName];

    STAssertEqualObjects(receivedMessage, originalMessage, @"Doesn't receive published message");
}

- (void)consumeMessage:(NSDictionary *)message {
    self.receivedDictionary = message;
}

@end
