//
//  RequestSenderTest.m
//  Punisher
//
//  Created by Vanger on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "RequestSenderTest.h"
#import "RequestSender.h"
#import "PrettyURLConnectionStub.h"
#import "ServerURLsGenerator.h"

@implementation RequestSenderTest

- (void)setUp {
	answer = @"some answer";
	connection = [[PrettyURLConnectionStub alloc] initWithAnswer:answer];
	requestSender = [[RequestSender alloc] initWithConnection:connection];
	requestSender.serverURLsGenerator = [[[ServerURLsGenerator alloc] init] autorelease];
	[super setUp];
}

- (void)tearDown {
	[requestSender release];
	[connection release];

	[super tearDown];
}

- (void)test_throws_exception_when_no_server_url_generator_setted {
	requestSender.serverURLsGenerator = NULL;

	STAssertThrows([requestSender postMessage:@""], @"when no ServerURLGenerator setted exception should be thrown");
}

- (void)test_send_request {
	NSString *responseText = [requestSender postMessage:@"blubla"];

	STAssertEqualObjects(responseText, answer, @"Received text not equals expected answer");
}

- (void)dealloc {
	[connection release];
	[requestSender release];
	[super dealloc];
}


@end
