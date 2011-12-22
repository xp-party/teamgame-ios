//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

extern NSString *const PLAYER_ID_PARAMETER_NAME;
extern NSString *const PLAYER_NAME_PARAMETER_NAME;


@protocol URLConnection;
@class ServerURLsGenerator;

@interface RequestSender : NSObject

@property(nonatomic, retain) IBOutlet id <URLConnection> connection;
@property(nonatomic, retain) IBOutlet ServerURLsGenerator *serverURLsGenerator;

- (id)initWithConnection:(id <URLConnection>)connection;

- (NSString *)postMessage:(NSString *)message;

- (NSDictionary *)registerAndGetTeamInformation;

- (void)sayHelloMessageFromPlayerWithId:(int)playerId andName:(NSString *)playerName;
@end