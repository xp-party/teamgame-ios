//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "../../Punisher/Server Communication/URLConnection.h"


@interface PrettyURLConnectionStub : NSObject <URLConnection>
- (id)initWithAnswer:(NSString *)answer;

@property(nonatomic, retain) NSString *answer;

@end