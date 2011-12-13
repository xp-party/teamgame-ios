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
#import "GameCompletionMessengerStub.h"

@implementation PunisherViewControllerTest

- (void)setUp {
    gameCompletionMessengerStub = [[GameCompletionMessengerStub alloc] init];

    controller = [[PunisherViewController alloc] initWithNibName:@"PunisherViewController" bundle:NULL];
    [controller.view setNeedsDisplay];
    controller.gameOverMessenger = gameCompletionMessengerStub;
}

- (void)tearDown {
    [controller release];
    [gameCompletionMessengerStub release];
}

- (void)testShould_Show_Alert {
    [controller.theGame chooseAnswer:ONE];
    STAssertTrue(gameCompletionMessengerStub.called, @"Should show alert");

}

@end
