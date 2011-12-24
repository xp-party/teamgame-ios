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
@class TGUserNameGenerator;

extern NSString *const HELLO_MESSAGE;

@interface PunisherViewController : UIViewController <MessageConsumer> {
	UILabel *debugLabel;
	UILabel *resultLabel;

	MiniGame *theGame;
}

@property(nonatomic, retain) IBOutlet UILabel *debugLabel;
@property(nonatomic, retain) IBOutlet UILabel *partnerResultLabel;
@property(nonatomic, retain) IBOutlet UILabel *statusLabel;

@property(nonatomic, retain) IBOutlet UILabel *myNameLabel;
@property(nonatomic, retain) IBOutlet UILabel *partnersNameLabel;


@property(nonatomic, retain) IBOutlet UIActivityIndicatorView *spinner;

@property(retain, nonatomic) IBOutlet MiniGame *theGame;

@property(nonatomic, retain) IBOutlet id <GameCompletionMessenger> gameOverMessenger;

@property(nonatomic, retain) IBOutlet RequestSender *requestSender;
@property(nonatomic, retain) IBOutlet ServerURLsGenerator *serverURLsGenerator;
@property(nonatomic, retain) IBOutlet TGUserNameGenerator *userNameGenerator;

- (IBAction)zeroButtonClicked;

- (IBAction)oneButtonClicked;

- (IBAction)startGame;


@end
