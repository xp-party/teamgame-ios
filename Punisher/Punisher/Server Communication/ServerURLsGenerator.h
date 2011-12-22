//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

extern NSString *const DEFAULT_SERVER_URL;
extern NSString *const USER_NAME_PARAMETER_NAME;

@interface ServerURLsGenerator : NSObject
@property(nonatomic, retain) NSString *serverAddress;
@property(nonatomic, retain) NSString *webSocketURL;
@property(nonatomic, retain) NSString *giveMyTeamURL;
@property(nonatomic, retain) NSString *parametrizedPostMessageURL;

- (ServerURLsGenerator *)initWithServerAddress:(NSString *)serverAddress;

- (NSString *)generatePostMessageURLWithText:(NSString *)message;

- (NSString *)generateWebSocketURL;

- (NSString *)generateGiveMyTeamRequestURLForUserName:(NSString *)userName;
@end