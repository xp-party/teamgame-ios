//
//  PunisherViewController.m
//  Punisher
//
//  Created by Виталий on 22.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PunisherViewController.h"
#import "MiniGame.h"

@implementation PunisherViewController

@synthesize zeroButton;
@synthesize oneButton;
@synthesize resultLabel;
@synthesize debugLabel;

@synthesize theGame;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Realization

-(IBAction) zeroButtonClicked {
    NSLog(@"You clicked 0");
    debugLabel.text = @"0";
    [theGame chooseAnswer: ZERO];
}

-(IBAction) oneButtonClicked{
    NSLog(@"You clicked 1");
    debugLabel.text = @"1";
    [theGame chooseAnswer: ONE];
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    resultLabel.text = @"Press the button, please. ^_^";
    [self.theGame addObserver:self];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return ((interfaceOrientation == UIInterfaceOrientationPortrait) || 
            (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown));
}

- (void)dealloc {
    [self.theGame removeObserver:self forKeyPath:STATE_PROPERTY context:nil];
    [debugLabel release];
    [theGame release];
    [zeroButton release];
    [oneButton release];
    [resultLabel release];
    [super dealloc];
}

#pragma mark - K-V Observing
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    self.resultLabel.text = @"Win";
}

@end
