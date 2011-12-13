//
//  Created by Vitaliy Ruzhnikov on 26.11.11.
//
//
//


#import "MiniGame.h"
#import "AnswerRandomizer.h"

NSString * const STATE_PROPERTY = @"state";

@interface MiniGame ()
- (void)changeState:(GameState)newState;

@end

@implementation MiniGame

@synthesize state = _state;
@synthesize partnersAnswer;

- (void)emulateAnswer {
    AnswerRandomizer *randomizer = [AnswerRandomizer alloc];
    self.partnersAnswer = [randomizer getNextPossibleAnswer];
    [randomizer release];
}

- (id)init {
    self = [super init];
    if (self) {
        [self emulateAnswer];
    }

    return self;
}


- (void)chooseAnswer:(Answer)chosenAnswer {
    if (chosenAnswer == self.partnersAnswer) {
        [self changeState:WIN];
    }
    else {
        [self changeState:LOSE];
    }
}

- (void)changeState:(GameState)newState {
    [self willChangeValueForKey:STATE_PROPERTY];
    _state = newState;
    [self didChangeValueForKey:STATE_PROPERTY];
}

- (void)addObserver:(NSObject *)observer {
    [self addObserver:observer forKeyPath:STATE_PROPERTY options:0 context:nil];
}

@end