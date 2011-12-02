//
//  Created by Vitaliy Ruzhnikov on 02.12.11.
//
//
//


#import <i386/param.h>
#import "AnswerRandomizerTest.h"
#import "../Punisher/AnswerRandomizer.h"

#define PERCENTS 1E-2

const int MAX_EXPERIMENTS = 1000000;
const float ACCURACY = 1.0f * PERCENTS;

@implementation AnswerRandomizerTest {
    AnswerRandomizer *randomizer;

}

- (void)tearDown {
    [super tearDown];
    [randomizer release];
}

- (void)setUp {
    [super setUp];
    randomizer = [[AnswerRandomizer alloc] init];
}

- (BOOL)isValidValue:(Answer)value {
    return value == ONE || value == ZERO;
}

- (void)testShould_provide_Zero_Or_One {
    for (int i = 0; i < MAX_EXPERIMENTS; i++) {

        Answer value = [randomizer getNextPossibleAnswer];

        STAssertTrue([self isValidValue:value], @"Should be 1 or 0");

        if (![self isValidValue:value]) {
            return;
        }
    }
}

- (void)testShould_provide_Uniform_Probability {
    int zeros_counter = 0;
    int ones_counter = 0;
    for (int i = 0; i < MAX_EXPERIMENTS; i++) {

        Answer value = [randomizer getNextPossibleAnswer];
        if (value == ZERO) zeros_counter++;
        else if (value == ONE) ones_counter++;
    }

    STAssertEqualsWithAccuracy(zeros_counter, ones_counter, MAX_EXPERIMENTS * ACCURACY,
        @"Should provide pseudo uniform probability with approximately %f of correct probability", 100 * (1-ACCURACY));

}

@end