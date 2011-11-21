//
//  Created by Vitaliy Ruzhnikov on 22.10.11.
//
//
//


#import <Foundation/Foundation.h>
#import "MessageConsumer.h"
#import "ZTWebSocket.h"

@protocol MessageConsumerDelegate;


@interface WebSocketMessageConsumer : NSObject <MessageConsumer> {

}
- (id)initWithDelegate:(NSObject <MessageConsumerDelegate> *)delegate webSocket:(ZTWebSocket *)webSocket;


@property (nonatomic, retain) ZTWebSocket *webSocket;


@end