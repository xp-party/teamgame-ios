//
//  PunisherTests.m
//  PunisherTests
//
//  Created by Виталий on 22.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PunisherTests.h"
#import "ZTWebSocket.h"

@implementation PunisherTests


@synthesize webSocket = _webSocket;

- (void)setUp
{
    [super setUp];
    NSString *url = @"ws://192.168.1.100:8081/";
    self.webSocket = [ZTWebSocket webSocketWithURLString:url delegate:self];
}

- (void)tearDown
{
    // Tear-down code here.

    [super tearDown];
}

- (void)test_Should_Open_Web_Socket
{
    [self.webSocket open];
    [self.webSocket send:@"AAAAA"];
    STAssertTrue(opened, @"should open web socket");
}



- (void)webSocket:(ZTWebSocket *)webSocket didFailWithError:(NSError *)error {

}

- (void)webSocketDidOpen:(ZTWebSocket *)webSocket {
    opened = YES;
}

- (void)webSocketDidClose:(ZTWebSocket *)webSocket {

}

- (void)webSocket:(ZTWebSocket *)webSocket didReceiveMessage:(NSString *)message {

}

- (void)webSocketDidSendMessage:(ZTWebSocket *)webSocket {

}

- (void)dealloc {
    [_webSocket release];
    [super dealloc];
}


@end
