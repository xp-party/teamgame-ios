//
//  Created by Vitaliy Ruzhnikov on 22.10.11.
//
//
//


#import "ZTWebSocket.h"

@protocol MessageConsumerDelegate;

@protocol MessageConsumer <ZTWebSocketDelegate>

@property (nonatomic, retain) NSObject<MessageConsumerDelegate> *delegate;

- (void)consumeMessage:(NSString *)message;

@end