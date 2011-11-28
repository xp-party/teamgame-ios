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

- (void)testShould_Change_Result_Label_After_Mini_Game_State_Changed
{
    PunisherViewController *controller = [[PunisherViewController alloc] initWithNibName:@"PunisherViewController" bundle:NULL];
    [controller.view setNeedsDisplay];
        
    [controller.theGame chooseAnswer:ZERO];
    
    STAssertEqualObjects(controller.resultLabel.text, @"Win", @"");
    
    [controller release];
}

@end
