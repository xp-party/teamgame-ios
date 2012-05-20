//
// Created by vanger on 20.05.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "TGMessageProcessor.h"

@protocol TGWatingIndicatorController;


@interface TGMessageProcessorImpl : NSObject <TGMessageProcessor>

@property(retain, nonatomic) IBOutlet id <TGWatingIndicatorController> waitingIndicator;

@end