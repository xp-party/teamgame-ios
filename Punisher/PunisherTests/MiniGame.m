//
//  Created by Vitaliy Ruzhnikov on 26.11.11.
//
//
//


#import "MiniGame.h"


@implementation MiniGame

@synthesize state = _state;
@synthesize answer = _answer;


- (void)chooseAnswer:(Answer)chosenAnswer {
    if (chosenAnswer == _answer) {
        _state = WIN;
    }
    else {
        _state = LOSE;
    }
}
@end