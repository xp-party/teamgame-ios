//
//  Created by alexeyrogatkin on 03.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "AnswerRandomizer.h"

@implementation AnswerRandomizer {

}

- (Answer)getNextPossibleAnswer {
    uint upperBound = (uint)ONE + 1;
    return (Answer)arc4random_uniform(upperBound);
}
@end