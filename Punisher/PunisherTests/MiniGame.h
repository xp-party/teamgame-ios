//
//  Created by Vitaliy Ruzhnikov on 26.11.11.
//
//
//


#import <Foundation/Foundation.h>

typedef enum State {
    UNDEFINED = 0,
    WIN = 1,
    LOSE = 2
} State;

typedef enum Answer {
    ZERO = 0,
    ONE = 1
} Answer;

@interface MiniGame : NSObject {

@private
    State _state;
    Answer _answer;
}

@property(nonatomic, readonly) State state;

@property(nonatomic, readonly) Answer answer;




- (void)chooseAnswer:(Answer)chosenAnswer;
@end