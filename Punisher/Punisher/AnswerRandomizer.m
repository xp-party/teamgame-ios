//
//  Created by Vitaliy Ruzhnikov on 02.12.11.
//
//
//


#import "AnswerRandomizer.h"

@implementation AnswerRandomizer {

}

- (Answer)getNextPossibleAnswer {
    uint upperBound = (uint)ONE + 1;
    return (Answer)arc4random_uniform(upperBound);
}
@end