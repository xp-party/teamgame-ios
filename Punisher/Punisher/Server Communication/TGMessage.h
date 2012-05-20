//
// Created by vanger on 20.05.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

extern NSString *const PLAYER_ID_PARAMETER_NAME;
extern NSString *const PLAYER_NAME_PARAMETER_NAME;

extern NSString *const TYPE_PARAMETER_NAME;
extern NSString *const HELLO_MESSAGE_TYPE;
extern NSString *const ECHO_HELLO_MESSAGE_TYPE;


@interface TGMessage : NSObject

@property(nonatomic, readonly) int playerNumber;
@property(retain, nonatomic, readonly) NSString *messageType;
@property(retain, nonatomic, readonly) NSString *fromPlayerName;

+ (TGMessage *)messageWithRawMessage:(NSDictionary *)rawMessage;
@end