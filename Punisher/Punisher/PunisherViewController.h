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

@class MiniGame;

extern NSString * const HELLO_MESSAGE;

@interface PunisherViewController : UIViewController {

    UIButton *zeroButton;
    UIButton *oneButton;
    UILabel *debugLabel;
    UILabel *resultLabel;

    MiniGame *theGame;
}

-(IBAction) zeroButtonClicked;
-(IBAction) oneButtonClicked;

@property(nonatomic, retain) IBOutlet UIButton *zeroButton;
@property(nonatomic, retain) IBOutlet UIButton *oneButton;
@property(nonatomic, retain) IBOutlet UILabel *resultLabel;
@property(nonatomic, retain) IBOutlet UILabel *debugLabel;

@property (retain, nonatomic) IBOutlet MiniGame *theGame;

@end
