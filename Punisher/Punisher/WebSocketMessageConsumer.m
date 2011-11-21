//
//  Created by Vitaliy Ruzhnikov on 22.10.11.
//
//
//


#import <Foundation/Foundation.h>
#import "WebSocketMessageConsumer.h"
#import "MessageConsumerDelegate.h"
#import "ZTWebSocket.h"


@implementation WebSocketMessageConsumer

@synthesize delegate = _delegate;
@synthesize webSocket = _webSocket;

- (id)initWithDelegate:(NSObject <MessageConsumerDelegate> *)delegate webSocket:(ZTWebSocket *)webSocket {
    self = [super init];
    if (self) {
        _delegate = [delegate retain];
        _webSocket = [webSocket retain];
        _webSocket.delegate = self;
        [_webSocket open];
    }

    return self;
}


- (void)consumeMessage:(NSString *)message {
    [self.delegate didConsumeMessage:message];
}

- (void)webSocket:(ZTWebSocket *)webSocket didReceiveMessage:(NSString *)message {
    NSLog(@"message: %@", message);
    [self consumeMessage:message];
}

- (void)dealloc {
    [_delegate release];
    [_webSocket release];
    [super dealloc];
}

- (void)webSocket:(ZTWebSocket *)webSocket didFailWithError:(NSError *)error {
    NSLog(@"Error: %@", error);
}

@end