//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PrettyURLConnectionImpl.h"


@implementation PrettyURLConnectionImpl {

}

- (NSData *)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(NSURLResponse **)response error:(NSError **)error {
	return [NSURLConnection sendSynchronousRequest:request returningResponse:response error:error];
}
@end