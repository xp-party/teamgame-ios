//
//  MessageProcessorImplTest.h
//  Punisher
//
//  Created by Vanger on 05/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "TGWatingIndicatorController.h"
#import "TGGameController.h"
#import "TGViewDataController.h"
#import "RequestSender.h"

@interface MessageProcessorImplTest : SenTestCase <TGWatingIndicatorController, TGGameController, TGViewDataController, RequestSender>

@end
