//
//  PunisherViewControllerTest.m
//  Punisher
//
//  Created by Vanger on 28.11.11.
//  Copyright (c) 2011 Flexis. All rights reserved.
//

#import "PunisherViewControllerTest.h"
#import "PunisherViewController.h"
#import "MiniGame.h"

@implementation PunisherViewControllerTest

- (void)setUp {
    controller = [[PunisherViewController alloc] initWithNibName:@"PunisherViewController" bundle:NULL];
    [controller.view setNeedsDisplay];
}

- (void)testResult_Label_Should_Be_Initialized_With_Hello_Message
{
    STAssertEqualObjects(controller.resultLabel.text, HELLO_MESSAGE, @"");
}



- (void)testShould_Change_Result_Label_After_Mini_Game_State_Changed_To_Win
{
    [controller.theGame chooseAnswer:ZERO];
    STAssertEqualObjects(controller.resultLabel.text, @"Win", @"");    
}


- (void)testShould_Change_Result_Label_After_Mini_Game_State_Changed_To_Lose
{
    [controller.theGame chooseAnswer:ONE];
    STAssertEqualObjects(controller.resultLabel.text, @"Loose", @"");    
}

- (void)tearDown {
    [controller release];
}


@end
