//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class WebSocketListener;


@interface FakeEventPublisher : NSObject

@property(nonatomic, retain) WebSocketListener *listner;

- (void)publish:(NSString *)string;

- (FakeEventPublisher *)initWithListner:(WebSocketListener *)listener;
@end