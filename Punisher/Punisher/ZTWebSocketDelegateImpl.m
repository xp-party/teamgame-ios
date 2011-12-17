//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "ZTWebSocketDelegateImpl.h"


@implementation ZTWebSocketDelegateImpl {

}

#pragma mark - ZTWebSocketDelegate

- (void)webSocket:(ZTWebSocket*)webSocket didFailWithError:(NSError*)error {
	NSLog(@"Error occured with webSocket %@: %@", webSocket.url, error);
}

- (void)webSocketDidOpen:(ZTWebSocket*)webSocket {
	NSLog(@"Opened webSocket %@", webSocket.url);
//	[webSocket send:@"ping"];
}

- (void)webSocketDidClose:(ZTWebSocket*)webSocket {
	NSLog(@"Closed webSocket %@", webSocket.url);
}

- (void)webSocket:(ZTWebSocket*)webSocket didReceiveMessage:(NSString*)message {
	NSLog(@"WebSocket %@ received message:\n%@", webSocket.url, message);
//	[self.listeningWebSocket send:@"ping"];
}
- (void)webSocketDidSendMessage:(ZTWebSocket*)webSocket {
	NSLog(@"WebSocket %@ send", webSocket.url);
}

@end