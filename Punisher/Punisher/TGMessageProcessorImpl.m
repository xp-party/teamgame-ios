//
// Created by vanger on 20.05.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "TGMessageProcessorImpl.h"


@implementation TGMessageProcessorImpl {

}
@synthesize waitingIndicator = _waitingIndicator;

- (void)processMessage:(TGMessage *)message {
}

- (void)dealloc {
	self.waitingIndicator = nil;
	[super dealloc];
}


@end