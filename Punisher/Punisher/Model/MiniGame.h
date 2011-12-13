//
//  Created by Vitaliy Ruzhnikov on 26.11.11.
//
//
//


#import <Foundation/Foundation.h>
#import "Constants.h"


typedef enum {
    UNDEFINED = 0,
    WIN = 1,
    LOSE = 2
} GameState;

extern NSString * const STATE_PROPERTY;

@interface MiniGame : NSObject {

@private
    GameState _state;
}

@property(nonatomic, readonly) GameState state;

@property(nonatomic) Answer partnersAnswer;

- (void)addObserver:(NSObject *)observer;
- (void)emulateAnswer;
- (void)chooseAnswer:(Answer)chosenAnswer;
@end