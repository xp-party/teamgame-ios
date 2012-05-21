//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "RequestSender.h"

@protocol URLConnection;
@class ServerURLsGenerator;

@interface RequestSenderImpl : NSObject <RequestSender>

@property(nonatomic, retain) IBOutlet id <URLConnection> connection;
@property(nonatomic, retain) IBOutlet ServerURLsGenerator *serverURLsGenerator;

- (id)initWithConnection:(id <URLConnection>)connection;

@end