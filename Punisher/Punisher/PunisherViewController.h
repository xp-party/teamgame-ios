//
//  PunisherViewController.h
//  Punisher
//
//  Created by Виталий on 22.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageConsumerDelegate.h"
#import "MessageConsumer.h"


@interface PunisherViewController : UIViewController <MessageConsumerDelegate> {
@private
    UILabel *_messageLabel;
    id <MessageConsumer> _consumer;
    UITextField *_input;
    ZTWebSocket *_webSocket;
}
@property (nonatomic, retain) UILabel *messageLabel;

@property (nonatomic, retain) UITextField *input;
@property (nonatomic, retain) id<MessageConsumer> consumer;
@property (nonatomic, retain) ZTWebSocket *webSocket;

@end
