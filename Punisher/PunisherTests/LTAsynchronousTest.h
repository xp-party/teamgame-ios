//
//  LTAsynchronousTest.h
//  LinguaLeo
//
//  Created by Oleg Ivanov on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>


@interface LTAsynchronousTest : SenTestCase {
	BOOL isRunLoopShouldStop;
}

- (void)startRunLoop;
- (void)stopRunLoop;

@end
