//
//  Created by Vitaliy Ruzhnikov on 26.11.11.
//
//
//


#import <Foundation/Foundation.h>
#import "Constants.h"


typedef enum State {
    UNDEFINED = 0,
    WIN = 1,
    LOSE = 2
} State;

extern NSString * const STATE_PROPERTY;

@interface MiniGame : NSObject {

@private
    State _state;
    Answer _answer;
}

@property(nonatomic, readonly) State state;

@property(nonatomic, readonly) Answer answer;


- (void)addObserver:(NSObject *)observer;

- (void)chooseAnswer:(Answer)chosenAnswer;
@end