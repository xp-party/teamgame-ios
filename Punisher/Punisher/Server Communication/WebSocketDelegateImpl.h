//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "ZTWebSocket.h"

@protocol MessageConsumer;


@interface WebSocketDelegateImpl : NSObject <ZTWebSocketDelegate>
@property(nonatomic, retain) IBOutlet id <MessageConsumer> messageConsumer;

- (WebSocketDelegateImpl *)initWithMessageConsumer:(id <MessageConsumer>)messageConsumer;

@end