//
//  PunisherViewController.m
//  Punisher
//
//  Created by Виталий on 22.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PunisherViewController.h"
#import "FakeMessagerConsumer.h"
#import "MessageConsumer.h"
#import "ZTWebSocket.h"
#import "WebSocketMessageConsumer.h"

@implementation PunisherViewController

@synthesize messageLabel = _messageLabel;
@synthesize consumer = _consumer;
@synthesize input = _input;
@synthesize webSocket = _webSocket;


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
    _messageLabel.text = @"";
    [self.view addSubview:self.messageLabel];

    NSString *URL = @"ws://192.168.1.104:8081/";
    self.webSocket = [ZTWebSocket webSocketWithURLString:URL delegate:nil];
    _consumer = [[WebSocketMessageConsumer alloc] initWithDelegate:self webSocket:self.webSocket];

    _input = [[UITextField alloc] initWithFrame:CGRectMake(0, 420, 320, 30)];
    _input.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_input];

    UIGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sendMessage)];
    [self.view addGestureRecognizer:tapRecognizer];
    [tapRecognizer release];
}

- (void)didConsumeMessage:(NSString *)message {
    self.messageLabel.text = [NSString stringWithFormat:@"%@\n%@", message, self.messageLabel.text];
}

- (void)sendMessage {
    [self.webSocket send:self.input.text];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [_messageLabel release];
    [_consumer release];
    [_input release];
    [_webSocket release];
    [super dealloc];
}


@end
