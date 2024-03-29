//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "RequestSenderImpl.h"
#import "URLConnection.h"
#import "ServerURLsGenerator.h"
#import "JSONKit.h"

#import "TGMessage.h"

@implementation RequestSenderImpl {

}

@synthesize connection = _connection;
@synthesize serverURLsGenerator = _serverURLsGenerator;


- (id)initWithConnection:(id <URLConnection>)connection {
	self.connection = connection;
	return self;
}

- (NSString *)sendRequestToURL:(NSString *)url {
	NSString *escapedURL = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSURL *URLToSend = [NSURL URLWithString:escapedURL];
	NSLog(@"Sending request: %@", URLToSend);
	NSURLRequest *request = [NSURLRequest requestWithURL:URLToSend];
	NSString *answer = [self.connection sendSynchronousRequest:request];
	NSLog(@"Received respone: %@", answer);
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

- (NSDictionary *)registerAndGetTeamInformation:(NSString *)userName {
	[self checkAvailabilityOfServerURLGenerator];
	NSString *url = [self.serverURLsGenerator generateGiveMyTeamRequestURLForUserName:userName];
	NSString *answer = [self sendRequestToURL:url];

	return [answer objectFromJSONString];
}

- (NSArray *)helloMessageKeys {
	return [NSArray arrayWithObjects:PLAYER_ID_PARAMETER_NAME, PLAYER_NAME_PARAMETER_NAME, TYPE_PARAMETER_NAME, NULL];
}

- (NSArray *)helloMessageValuesFromPlayer:(int)playerNumber withName:(NSString *)playerName helloType:(NSString *)helloType {
	return [NSArray arrayWithObjects:[NSNumber numberWithInt:playerNumber], playerName, helloType, NULL];
}

//TODO: test it!
- (void)sendJSONRequestWithValues:(NSArray *)values andKeys:(NSArray *)keys {
	NSDictionary *messageParams = [NSDictionary dictionaryWithObjects:values
															  forKeys:keys];
	[self postMessage:[messageParams JSONString]];
}

//TODO: test it!
- (void)sayHelloMessageFromPlayerWithId:(int)playerNumber andName:(NSString *)playerName {
	NSArray *values = [self helloMessageValuesFromPlayer:playerNumber withName:playerName helloType:HELLO_MESSAGE_TYPE];
	NSArray *keys = [self helloMessageKeys];
	[self sendJSONRequestWithValues:values andKeys:keys];
}

//TODO: test it!
- (void)sayEchoHelloMessageFromPlayerWithId:(int)playerNumber andName:(NSString *)playerName {
	NSArray *values = [self helloMessageValuesFromPlayer:playerNumber withName:playerName helloType:ECHO_HELLO_MESSAGE_TYPE];
	NSArray *keys = [self helloMessageKeys];
	[self sendJSONRequestWithValues:values andKeys:keys];

}

- (void)dealloc {
	self.serverURLsGenerator = nil;
	self.connection = nil;
	[super dealloc];
}

@end