//
//  Created by Vitaliy Ruzhnikov on 22.10.11.
//
//
//


#import "ZTWebSocket.h"

@protocol MessageConsumer <ZTWebSocketDelegate>

- (void)consumeMessage:(NSDictionary *)message;

@end