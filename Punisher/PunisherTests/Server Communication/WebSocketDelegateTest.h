//
//  WebSocketListenerTest.h
//  Punisher
//
//  Created by Vanger on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

//  Logic unit tests contain unit test code that is designed to be linked into an independent test executable.
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

#import <SenTestingKit/SenTestingKit.h>
#import "MessageConsumer.h"

@interface WebSocketDelegateTest : SenTestCase <MessageConsumer>

@property(nonatomic, assign) NSString *receivedMessage;

@end
