//
// Created by vanger on 20.05.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


@class TGMessage;

@protocol TGMessageProcessor <NSObject>

- (void)processMessage:(TGMessage *)message;

@end