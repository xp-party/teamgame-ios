//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "RequestSender.h"
#import "PrettyURLConnection.h"


@implementation RequestSender {

}

@synthesize connection = _connection;

- (id)initWithConnection:(id <PrettyURLConnection>)connection {
	_connection = [connection retain];
	return self;
}

- (NSString *)sendRequest:(NSString *)requestString {
	NSURL *postURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://169.254.6.84:9000/socket/post?message=%@", requestString]];
	NSURLRequest *request = [NSURLRequest requestWithURL:postURL];
	NSError **error = nil;

	NSString *answer = [self.connection sendSynchronousRequest:request returningResponse:NULL error:error];
	if (error) {
		NSLog(@"Error occured: %@", *error);
	}

	return answer;
}

- (void)dealloc {
	[_connection release], _connection = nil;
	[super dealloc];
}
@end