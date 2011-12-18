//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "PrettyURLConnection.h"


@interface PrettyURLConnectionStub : NSObject <PrettyURLConnection>
- (id)initWithAnswer:(NSString *)answer;

@property(nonatomic, retain) NSString *answer;

@end