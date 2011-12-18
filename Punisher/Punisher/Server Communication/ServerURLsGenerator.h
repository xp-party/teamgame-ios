//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

extern NSString *DEFAULT_SERVER_URL;

@interface ServerURLsGenerator : NSObject
@property(nonatomic, retain) NSString *serverAddress;
@property(nonatomic, retain) NSString *webSocketURL;
@property(nonatomic, retain) NSString *giveMyTeamURL;
@property(nonatomic, retain) NSString *parametrizedPostMessageURL;

- (ServerURLsGenerator *)initWithServerAddress:(NSString *)serverAddress;

- (NSString *)generatePostMessageURLWithText:(NSString *)message;

- (NSString *)generateWebSocketURL;

- (NSString *)generateGiveMyTeamRequestURL;
@end