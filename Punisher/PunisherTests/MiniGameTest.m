//
//  MiniGameTest.m
//  Punisher
//
//  Created by Виталий on 11/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MiniGameTest.h"
#import "MiniGame.h"

@implementation MiniGameTest

- (void)setUp {
    [super setUp];
    miniGame = [[MiniGame alloc] init];
    miniGame.partnersAnswer = ZERO;
}

- (void)tearDown {
    [miniGame release];
    [super tearDown];
}

- (void)testShould_Be_In_Undefined_State_After_Init {
    STAssertEquals(miniGame.state, UNDEFINED, @"");
}

- (void)testShould_Be_With_Answer_Zero_After_Init {
    STAssertEquals(miniGame.partnersAnswer, 0, @"");
}

- (void)testShould_Win_If_Guess_Answer {
    [miniGame chooseAnswer:ZERO];
    STAssertEquals(miniGame.state, WIN, @"");
}

- (void)testShould_Lose_If_Do_Not_Guess_Answer {
    [miniGame chooseAnswer:ONE];
    STAssertEquals(miniGame.state, LOSE, @"");
}

-(void)testShould_Notified_If_Changed_State_In_Mini_Game {
    [miniGame addObserver:self];

    [miniGame chooseAnswer:ZERO];

    STAssertTrue(notified, @"");

    [miniGame removeObserver:self forKeyPath:STATE_PROPERTY];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    notified = YES;
}


@end
