//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "RequestSender.h"
#import "PrettyURLConnection.h"
#import "ServerURLsGenerator.h"


@implementation RequestSender {

}

@synthesize connection = _connection;
@synthesize serverURLsGenerator = _serverURLsGenerator;


- (id)initWithConnection:(id <PrettyURLConnection>)connection {
	self.connection = connection;
	return self;
}

- (NSString *)sendRequest:(NSString *)requestText {
	if (!self.serverURLsGenerator) {
		[NSException raise:@"ServerURLsGenerator isn't initialized"
					format:@"RequestSender.serverURLsGenerator is NULL, initialize it properly!"];
	}
	NSURL *postURL = [NSURL URLWithString:[self.serverURLsGenerator generatePostMessageURLWithText:requestText]];
	NSURLRequest *request = [NSURLRequest requestWithURL:postURL];
	NSError **error = nil;

	NSString *answer = [self.connection sendSynchronousRequest:request returningResponse:NULL error:error];
	if (error) {
		NSLog(@"Error occured: %@", *error);
	}

	return answer;
}

- (void)dealloc {
	self.serverURLsGenerator = nil;
	self.connection = nil;
	[super dealloc];
}
@end