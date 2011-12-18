//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "WebSocketDelegateImpl.h"
#import "MessageConsumer.h"


@implementation WebSocketDelegateImpl {

}

@synthesize messageConsumer = _messageConsumer;

- (WebSocketDelegateImpl *)initWithMessageConsumer:(id <MessageConsumer>)messageConsumer {
	self.messageConsumer = messageConsumer;
	return self;
}

- (void)dealloc {
	self.messageConsumer = nil;
	[super dealloc];
}

- (void)webSocket:(ZTWebSocket *)webSocket didReceiveMessage:(NSString *)message {
	NSLog(@"WebSocket %@ received message:\n%@", webSocket.url, message);
	[self.messageConsumer consumeMessage:message];
}

- (void)webSocket:(ZTWebSocket *)webSocket didFailWithError:(NSError *)error {
	NSLog(@"Error occured with webSocket %@: %@", webSocket.url, error);
}

- (void)webSocketDidOpen:(ZTWebSocket *)webSocket {
	NSLog(@"Opened webSocket %@", webSocket.url);
//	[webSocket send:@"ping"];
}

- (void)webSocketDidClose:(ZTWebSocket *)webSocket {
	NSLog(@"Closed webSocket %@", webSocket.url);
}

- (void)webSocketDidSendMessage:(ZTWebSocket *)webSocket {
	NSLog(@"WebSocket %@ send", webSocket.url);
}


@end