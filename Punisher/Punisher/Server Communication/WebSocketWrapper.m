//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "WebSocketWrapper.h"
#import "ZTWebSocket.h"
#import "ServerURLsGenerator.h"


@implementation WebSocketWrapper {

}
@synthesize webSocket = _webSocket;
@synthesize serverURLsGenerator = _serverURLsGenerator;
@synthesize webSocketDelegate = _webSocketDelegate;

- (void)launchSocket {
	ZTWebSocket *webSocket = [[ZTWebSocket alloc] initWithURLString:[self.serverURLsGenerator generateWebSocketURL]
														   delegate:self.webSocketDelegate];
	self.webSocket = webSocket;

	[self.webSocket open];
	[webSocket release];
}

- (void)dealloc {
    [self.webSocket close];
    self.webSocket = nil;
	self.serverURLsGenerator = nil;
	self.webSocketDelegate = nil;
	[super dealloc];
}
@end