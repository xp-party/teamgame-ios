//
//  JSONSerializationTest.m
//  Punisher
//
//  Created by Vanger on 12/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "JSONSerializationTest.h"
#import "JSONKit.h"

@implementation JSONSerializationTest

- (void)testJSONSerialization {
	JSONDecoder *decoder = [JSONDecoder decoder];
	NSString *message = @"{\"msg\": \"hello\"}";

	NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
	NSDictionary *res = [decoder objectWithData:data];

	id messageText = [res valueForKey:@"msg"];

	STAssertEqualObjects(messageText, @"hello", @"");

}

@end
