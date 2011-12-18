//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@protocol PrettyURLConnection;

@interface RequestSender : NSObject

@property(nonatomic, readonly, retain) id <PrettyURLConnection> connection;

- (id)initWithConnection:(id <PrettyURLConnection>)connection;

- (NSString *)sendRequest:(NSString *)string;
@end