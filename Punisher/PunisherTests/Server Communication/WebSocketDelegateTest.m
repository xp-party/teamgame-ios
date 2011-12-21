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

@synthesize receivedMessage = _receivedMessage;

- (void)test_Should_Receive_Message_From_Web_Socket_Delegate_When_Come_Message_From_Web_Socket {
    WebSocketDelegateImpl *listener = [[[WebSocketDelegateImpl alloc] initWithMessageConsumer:self] autorelease];
    NSString *message = @"some message";

    [listener webSocket:NULL didReceiveMessage:message];

    STAssertEqualObjects(self.receivedMessage, message, @"Doesn't receive published message");
}

- (void)consumeMessage:(NSString *)message {
    self.receivedMessage = message;
}

@end
