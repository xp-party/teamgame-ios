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
#import "TGWatingIndicatorController.h"
#import "TGViewDataController.h"
#import "TGGameController.h"

@class MiniGame;
@class GameCompletionMessengerStub;
@class ServerURLsGenerator;
@class TGUserNameGenerator;
@protocol TGMessageProcessor;
@protocol RequestSender;

extern NSString *const HELLO_MESSAGE;

@interface PunisherViewController : UIViewController <MessageConsumer, TGWatingIndicatorController, TGViewDataController, TGGameController> {

	UIButton *zeroButton;
	UIButton *oneButton;
	UILabel *debugLabel;
	UILabel *resultLabel;

	MiniGame *theGame;
}

@property(nonatomic, retain) IBOutlet UIButton *zeroButton;
@property(nonatomic, retain) IBOutlet UIButton *oneButton;
@property(nonatomic, retain) IBOutlet UILabel *debugLabel;
@property(nonatomic, retain) IBOutlet UILabel *partnerResultLabel;
@property(nonatomic, retain) IBOutlet UILabel *statusLabel;

@property(nonatomic, retain) IBOutlet UILabel *myNameLabel;
@property(nonatomic, retain) IBOutlet UILabel *partnersNameLabel;


@property(nonatomic, retain) IBOutlet UIActivityIndicatorView *spinner;

@property(retain, nonatomic) IBOutlet MiniGame *theGame;

@property(nonatomic, retain) IBOutlet id <GameCompletionMessenger> gameOverMessenger;

@property(nonatomic, retain) IBOutlet id <TGMessageProcessor> messageProcessor;

@property(nonatomic, retain) IBOutlet id<RequestSender> requestSender;
@property(nonatomic, retain) IBOutlet ServerURLsGenerator *serverURLsGenerator;
@property(nonatomic, retain) IBOutlet TGUserNameGenerator *userNameGenerator;


@property(nonatomic) int myPlayerNumber;

- (IBAction)zeroButtonClicked;

- (IBAction)oneButtonClicked;

- (IBAction)startGame;


@end
