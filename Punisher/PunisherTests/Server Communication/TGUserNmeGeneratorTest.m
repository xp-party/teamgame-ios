//
//  TGUserNmeGeneratorTest.m
//  Punisher
//
//  Created by Vanger on 12/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TGUserNmeGeneratorTest.h"
#import "../../Punisher/Server Communication/TGUserNameGenerator.h"

@implementation TGUserNmeGeneratorTest

- (void)testUserNameCreatedProperly {
	TGUserNameGenerator *userNameGenerator = [[TGUserNameGenerator alloc] init];

	NSString *deviceName = [[UIDevice currentDevice] name];
	NSString *userName = [userNameGenerator userName];
	STAssertEqualObjects(deviceName, userName, @"Device name should be used as UserName");
	[userNameGenerator release];
}

@end
