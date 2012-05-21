//
// Created by vanger on 20.05.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "TGMessageProcessor.h"

@protocol TGWatingIndicatorController;
@protocol TGGameController;
@protocol TGViewDataController;
@protocol RequestSender;
@class TGUserNameGenerator;


@interface TGMessageProcessorImpl : NSObject <TGMessageProcessor>

@property(retain, nonatomic) IBOutlet id <TGWatingIndicatorController> waitingIndicator;

@property(nonatomic, retain) id<TGGameController> gameController;
@property(nonatomic, retain) id<TGViewDataController> viewDataController;
@property(nonatomic, retain) id<RequestSender> requestSender;
@property(nonatomic, readwrite, retain) TGUserNameGenerator *userNameGenerator;
@end