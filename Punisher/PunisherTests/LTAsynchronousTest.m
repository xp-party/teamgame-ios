//
//  LTAsynchronousTest.m
//  LinguaLeo
//
//  Created by Oleg Ivanov on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LTAsynchronousTest.h"

@interface LTAsynchronousTest()

@property (assign) BOOL isRunLoopShouldStop;

@end


@implementation LTAsynchronousTest

@synthesize isRunLoopShouldStop;

- (void)setUp {
}

- (void)tearDown {
}

- (void)startRunLoop {
	NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
	NSDate *futureDate = [NSDate dateWithTimeIntervalSinceNow:100000];
	self.isRunLoopShouldStop = NO;
	
	while (!self.isRunLoopShouldStop && [runLoop runMode:NSDefaultRunLoopMode beforeDate:futureDate]) {
		
	}
}

- (void)stopRunLoop {
	self.isRunLoopShouldStop = YES;
}

@end
