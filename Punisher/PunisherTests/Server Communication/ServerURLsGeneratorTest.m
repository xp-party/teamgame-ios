//
//  ServerURLsGeneratorTest.m
//  Punisher
//
//  Created by Vanger on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ServerURLsGeneratorTest.h"
#import "ServerURLsGenerator.h"

NSString *FAKE_SERVER_ADDRESS = @"my_host.com:9090";

@implementation ServerURLsGeneratorTest

- (void)setUp {
	serverInfo = [[ServerURLsGenerator alloc] initWithServerAddress:FAKE_SERVER_ADDRESS];

	[super setUp];
}

- (void)tearDown {
	[serverInfo release];
	[super tearDown];
}


- (void)test_websocket_url_formed_properly {
	NSString *webSocketURL = [serverInfo generateWebSocketURL];

	NSString *expectedURL = [NSString stringWithFormat:@"ws://%@/socket/listen", FAKE_SERVER_ADDRESS];
	STAssertEqualObjects(webSocketURL, expectedURL, @"WebSocket URL formed incorrectly");
}

- (void)test_post_message_url_formed_properly {
	NSString *message = @"some message";
	NSString *postMessageURL = [serverInfo generatePostMessageURLWithText:message];
	NSString *expectedURL = [NSString stringWithFormat:@"http://%@/socket/post?message=%@", FAKE_SERVER_ADDRESS, message];
	STAssertEqualObjects(postMessageURL, expectedURL, @"URL for posting messages formed incorrectly");
}

- (void)test_default_server_address_setted_in_init {
	ServerURLsGenerator *defaultServerInfo = [[ServerURLsGenerator alloc] init];

	STAssertEqualObjects(defaultServerInfo.serverAddress, DEFAULT_SERVER_URL, @"In 'init' should be set default server address.");
	[defaultServerInfo release];
}

- (void)dealloc {
	[serverInfo release];
	[super dealloc];
}

@end
