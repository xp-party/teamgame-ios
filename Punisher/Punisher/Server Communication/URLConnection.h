//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


@protocol URLConnection <NSObject>
- (NSString *)sendSynchronousRequest:(NSURLRequest *)request;
@end