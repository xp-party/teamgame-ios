//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PrettyURLConnectionImpl.h"


@implementation PrettyURLConnectionImpl {

}

- (NSString *)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(NSURLResponse **)response error:(NSError **)error {
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:response error:error];
	return [NSString stringWithUTF8String:[data bytes]];
}
@end