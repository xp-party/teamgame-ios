//
// Created by vanger on 21.05.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


@protocol URLConnection;
@class ServerURLsGenerator;

@protocol RequestSender <NSObject>
- (NSString *)postMessage:(NSString *)message;

- (NSDictionary *)registerAndGetTeamInformation:(NSString *)userName;

- (void)sayHelloMessageFromPlayerWithId:(int)playerNumber andName:(NSString *)playerName;

- (void)sayEchoHelloMessageFromPlayerWithId:(int)playerNumber andName:(NSString *)playerName;
@end