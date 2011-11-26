//
//  Created by Vitaliy Ruzhnikov on 26.11.11.
//
//
//


#import "MiniGame.h"

NSString * const STATE_PROPERTY = @"state";

@interface MiniGame ()
- (void)changeState:(State)newState;

@end

@implementation MiniGame

@synthesize state = _state;
@synthesize answer = _answer;


- (void)chooseAnswer:(Answer)chosenAnswer {
    if (chosenAnswer == _answer) {
        [self changeState:WIN];
    }
    else {
        [self changeState:LOSE];
    }
}

- (void)changeState:(State)newState {
    [self willChangeValueForKey:STATE_PROPERTY];
    _state = newState;
    [self didChangeValueForKey:STATE_PROPERTY];
}

- (void)addObserver:(NSObject *)observer {
    [self addObserver:observer forKeyPath:STATE_PROPERTY options:0 context:nil];
}

@end