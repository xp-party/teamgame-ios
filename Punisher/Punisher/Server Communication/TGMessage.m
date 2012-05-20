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

@interface TGMessage ()
- (id)initWithRawMessage:(NSDictionary *)dictionary;

@end

@implementation TGMessage {

}

@synthesize playerNumber = _playerNumber;
@synthesize messageType = _messageType;
@synthesize fromPlayerName = _fromPlayerName;


+ (TGMessage *)messageWithRawMessage:(NSDictionary *)rawMessage {
	return [[[TGMessage alloc] initWithRawMessage:rawMessage] autorelease];
}

- (id)initWithRawMessage:(NSDictionary *)dictionary {
	_playerNumber = [[dictionary valueForKey:PLAYER_ID_PARAMETER_NAME] intValue];
	_messageType = [[dictionary valueForKey:TYPE_PARAMETER_NAME] retain];
	_fromPlayerName = [[dictionary valueForKey:PLAYER_NAME_PARAMETER_NAME] retain];

	return self;
}

- (void)dealloc {
	_messageType = nil;
	[_messageType release];
	_fromPlayerName = nil;
	[_fromPlayerName release];
	[super dealloc];
}


@end