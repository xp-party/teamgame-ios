//
//  PunisherViewController.h
//  Punisher
//
//  Created by Виталий on 22.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameCompletionMessenger.h"
#import "MessageConsumer.h"

@class MiniGame;
@class GameCompletionMessengerStub;
@class RequestSender;
@class ServerURLsGenerator;

extern NSString *const HELLO_MESSAGE;

@interface PunisherViewController : UIViewController <MessageConsumer> {

	UIButton *zeroButton;
	UIButton *oneButton;
	UILabel *debugLabel;
	UILabel *resultLabel;

	MiniGame *theGame;
}

- (IBAction)zeroButtonClicked;

- (IBAction)oneButtonClicked;

@property(nonatomic, retain) IBOutlet UIButton *zeroButton;
@property(nonatomic, retain) IBOutlet UIButton *oneButton;
@property(nonatomic, retain) IBOutlet UILabel *debugLabel;
@property(nonatomic, retain) IBOutlet UILabel *partnerResultLabel;

@property(retain, nonatomic) IBOutlet MiniGame *theGame;

@property(nonatomic, retain) IBOutlet id <GameCompletionMessenger> gameOverMessenger;

@property(nonatomic, retain) IBOutlet RequestSender *requestSender;
@property(nonatomic, retain) IBOutlet ServerURLsGenerator *serverURLsGenerator;

@end
