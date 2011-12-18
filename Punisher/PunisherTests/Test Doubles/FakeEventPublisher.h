//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class WebSocketDelegateImpl;


@interface FakeEventPublisher : NSObject

@property(nonatomic, retain) WebSocketDelegateImpl *listner;

- (void)publish:(NSString *)string;

- (FakeEventPublisher *)initWithListner:(WebSocketDelegateImpl *)listener;
@end