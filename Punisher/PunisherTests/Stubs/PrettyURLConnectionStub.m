//
//  Created by vanger on 18.12.11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PrettyURLConnectionStub.h"


@implementation PrettyURLConnectionStub {

}

@synthesize answer = _answer;

- (PrettyURLConnectionStub *)initWithAnswer:(NSString *)answer {
	self = [super init];
	self.answer = answer;

	return self;
}

- (NSData *)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(NSURLResponse **)response error:(NSError **)error {
	return [_answer dataUsingEncoding:NSUTF8StringEncoding];
}

- (void)dealloc {
	[_answer release], _answer = nil;
	[super dealloc];
}
@end