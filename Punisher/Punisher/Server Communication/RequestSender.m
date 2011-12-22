//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "RequestSender.h"
#import "URLConnection.h"
#import "ServerURLsGenerator.h"


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

- (void)sendConnectToTeamMessage {
	[self checkAvailabilityOfServerURLGenerator];
	NSString *url = [self.serverURLsGenerator generateGiveMyTeamRequestURL];
	NSString *answer = [self sendRequestToURL:url];

	return answer;
}

- (void)dealloc {
	self.serverURLsGenerator = nil;
	self.connection = nil;
	[super dealloc];
}
@end