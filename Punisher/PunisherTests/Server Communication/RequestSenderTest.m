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

@implementation RequestSenderTest

// All code under test must be linked into the Unit Test bundle
- (void)test_send_request {
	NSString *answer = @"some answer";
	id <PrettyURLConnection> connection = [[PrettyURLConnectionStub alloc] initWithAnswer:answer];
	RequestSender *requestSender = [[RequestSender alloc] initWithConnection:connection];

	NSString *responseText = [requestSender sendRequest:@"blubla"];

	STAssertEqualObjects(responseText, answer, @"Received text not equals expected answer");
	[requestSender release];
	[connection release];
}

@end
