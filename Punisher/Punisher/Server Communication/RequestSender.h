//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@protocol PrettyURLConnection;
@class ServerURLsGenerator;

@interface RequestSender : NSObject

@property(nonatomic, retain) IBOutlet id <PrettyURLConnection> connection;
@property(nonatomic, retain) IBOutlet ServerURLsGenerator *serverURLsGenerator;

- (id)initWithConnection:(id <PrettyURLConnection>)connection;

- (NSString *)sendRequest:(NSString *)string;
@end