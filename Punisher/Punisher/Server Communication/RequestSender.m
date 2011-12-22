//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "RequestSender.h"
#import "URLConnection.h"
#import "ServerURLsGenerator.h"
#import "JSONKit.h"

NSString *const PLAYER_ID_PARAMETER_NAME = @"playerId";
NSString *const PLAYER_NAME_PARAMETER_NAME = @"playerName";

@implementation RequestSender {

}

@synthesize connection = _connection;
@synthesize serverURLsGenerator = _serverURLsGenerator;


- (id)initWithConnection:(id <URLConnection>)connection {
	self.connection = connection;
	return self;
}

- (NSString *)sendRequestToURL:(NSString *)url {
	NSURL *postURL = [NSURL URLWithString:url];
	NSLog(@"Sending request: %@", url);
	NSURLRequest *request = [NSURLRequest requestWithURL:postURL];
	[NSURLRequest requestWithURL:postURL];
	NSString *answer = [self.connection sendSynchronousRequest:request];
	return answer;
}

- (void)checkAvailabilityOfServerURLGenerator {
	if (!self.serverURLsGenerator) {
		[NSException raise:@"ServerURLsGenerator isn't initialized"
					format:@"RequestSender.serverURLsGenerator is NULL, initialize it properly!"];
	}
}

- (NSString *)postMessage:(NSString *)message {
	[self checkAvailabilityOfServerURLGenerator];
	NSString *url = [self.serverURLsGenerator generatePostMessageURLWithText:message];
	NSString *answer = [self sendRequestToURL:url];

	return answer;
}

- (NSDictionary *)registerAndGetTeamInformation {
	[self checkAvailabilityOfServerURLGenerator];
	NSString *url = [self.serverURLsGenerator generateGiveMyTeamRequestURLForUserName:nil];
	NSString *answer = [self sendRequestToURL:url];

	return [answer objectFromJSONString];
}

- (void)sayHelloMessageFromPlayerWithId:(int)playerId andName:(NSString *)playerName {
	NSArray *values = [NSArray arrayWithObjects:[NSNumber numberWithInt:playerId], playerName, NULL];
	NSArray *keys = [NSArray arrayWithObjects:PLAYER_ID_PARAMETER_NAME, PLAYER_NAME_PARAMETER_NAME, NULL];
	NSDictionary *messageParams = [NSDictionary dictionaryWithObjects:values
															  forKeys:keys];
	[self postMessage:[messageParams JSONString]];
}


- (void)dealloc {
	self.serverURLsGenerator = nil;
	self.connection = nil;
	[super dealloc];
}
@end