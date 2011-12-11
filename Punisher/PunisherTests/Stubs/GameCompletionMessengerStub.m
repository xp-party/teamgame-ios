//
//  Created by Vitaliy Ruzhnikov on 03.12.11.
//
//
//


#import "GameCompletionMessengerStub.h"


@implementation GameCompletionMessengerStub {

@private
    BOOL _called;
}


@synthesize called = _called;

- (void)showGameOver:(GameState)gameState {
    _called = YES;
}


@end