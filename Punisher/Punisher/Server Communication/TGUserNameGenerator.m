//
//  Created by vanger on 22.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "TGUserNameGenerator.h"


@implementation TGUserNameGenerator {

}

- (NSString *)userName {
   return [[UIDevice currentDevice] name];
}
@end