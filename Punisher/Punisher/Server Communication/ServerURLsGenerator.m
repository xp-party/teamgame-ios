//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "ServerURLsGenerator.h"

NSString *const DEFAULT_SERVER_URL = @"localhost:9000";
NSString *const USER_NAME_PARAMETER_NAME = @"userName";


@implementation ServerURLsGenerator {

}

@synthesize webSocketURL = _webSocketURL;
@synthesize serverAddress = _serverAddress;
@synthesize parametrizedPostMessageURL = _parametrizedPostMessageURL;
@synthesize giveMyTeamURL = _giveMyTeamURL;


- (id)init {
	self = [super init];
	[self initWithServerAddress:DEFAULT_SERVER_URL];

	return self;
}


- (ServerURLsGenerator *)initWithServerAddress:(NSString *)serverAddress {
	self.serverAddress = serverAddress;
	self.webSocketURL = [NSString stringWithFormat:@"ws://%@/socket/listen", serverAddress];
	self.giveMyTeamURL = [NSString stringWithFormat:@"http://%@/giveMyTeam?%@=%@", serverAddress, USER_NAME_PARAMETER_NAME, @"%@"];
	self.parametrizedPostMessageURL = [NSString stringWithFormat:@"http://%@/socket/post?message=%@", serverAddress, @"%@"];
	return self;
}

- (void)dealloc {
	self.serverAddress = NULL;
	self.webSocketURL = NULL;
	self.parametrizedPostMessageURL = NULL;

	self.giveMyTeamURL = NULL;
    [super dealloc];
}

- (NSString *)generateWebSocketURL {
	return self.webSocketURL;
}

- (NSString *)generatePostMessageURLWithText:(NSString *)message {
	return [NSString stringWithFormat:self.parametrizedPostMessageURL, message];
}

- (NSString *)generateGiveMyTeamRequestURLForUserName:(NSString *)userName {
	return [NSString stringWithFormat:self.giveMyTeamURL, userName];
}
@end