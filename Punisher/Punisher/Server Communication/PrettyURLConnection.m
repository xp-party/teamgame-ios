//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PrettyURLConnection.h"


@implementation PrettyURLConnection {

}

- (NSString *)sendSynchronousRequest:(NSURLRequest *)request {
    NSError *error = nil;
	NSURLResponse *response = NULL;
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error) {
        NSLog(@"Error occured during send synchronous request %@", error);
    }


	NSString *answer = [[[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding] autorelease];
	return answer;
}
@end