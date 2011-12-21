//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class ZTWebSocket;
@class ServerURLsGenerator;
@protocol ZTWebSocketDelegate;

@interface WebSocketWrapper : NSObject
@property(nonatomic, retain) ZTWebSocket *webSocket;

@property(nonatomic, retain) IBOutlet ServerURLsGenerator *serverURLsGenerator;
@property(nonatomic, retain) IBOutlet id <ZTWebSocketDelegate> webSocketDelegate;

- (void)launchSocket;

@end