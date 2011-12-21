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
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if (error) {
        NSLog(@"Error occured during send synchronous request %@", error);
    }
	return [NSString stringWithUTF8String:[data bytes]];
}
@end