//
// Created by vanger on 20.05.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "TGMessage.h"

NSString *const PLAYER_ID_PARAMETER_NAME = @"playerNumber";
NSString *const PLAYER_NAME_PARAMETER_NAME = @"playerName";

NSString *const TYPE_PARAMETER_NAME = @"type";
NSString *const HELLO_MESSAGE_TYPE = @"hello!";
NSString *const ECHO_HELLO_MESSAGE_TYPE = @"echo-hello!";

@implementation TGMessage {

}
@synthesize playerNumber = _playerNumber;
@synthesize messageType = _messageType;
@synthesize fromPlayerName = _fromPlayerName;


- (id)initWithRawMessage:(NSDictionary *)dictionary {
	self.playerNumber = [[dictionary valueForKey:PLAYER_ID_PARAMETER_NAME] intValue];
	self.messageType = [dictionary valueForKey:TYPE_PARAMETER_NAME];
	self.fromPlayerName = [dictionary valueForKey:PLAYER_NAME_PARAMETER_NAME];

	return self;
}

- (void)dealloc {
	self.messageType = nil;
	self.fromPlayerName = nil;
	[super dealloc];
}


@end