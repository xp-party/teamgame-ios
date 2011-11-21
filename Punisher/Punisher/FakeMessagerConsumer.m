//
//  Created by Vitaliy Ruzhnikov on 22.10.11.
//
//
//


#import <Foundation/Foundation.h>
#import "FakeMessagerConsumer.h"
#import "MessageConsumer.h"
#import "MessageConsumerDelegate.h"


@implementation FakeMessagerConsumer
@synthesize delegate = _delegate;

- (void)consumeMessage:(NSString *)message {
    [self.delegate performSelector:@selector(didConsumeMessage:) withObject:message afterDelay:3.0];
//    [self.delegate didConsumeMessage:message];
}
@end