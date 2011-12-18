//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


@protocol PrettyURLConnection <NSObject>
- (NSData *)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(NSURLResponse **)response error:(NSError **)error;
@end