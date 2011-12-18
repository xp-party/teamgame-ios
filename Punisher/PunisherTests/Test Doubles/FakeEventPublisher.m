//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "FakeEventPublisher.h"
#import "../../Punisher/Server Communication/WebSocketDelegateImpl.h"


@implementation FakeEventPublisher {

}

@synthesize listner = _listner;

- (FakeEventPublisher *)initWithListner:(WebSocketDelegateImpl *)listener {
	self.listner = listener;
	return self;

}

- (void)dealloc {
	self.listner = nil;
	[super dealloc];
}

- (void)publish:(NSString *)event {
	[self.listner webSocket:NULL didReceiveMessage:event];
}

@end