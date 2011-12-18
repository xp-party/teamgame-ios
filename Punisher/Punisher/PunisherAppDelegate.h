//
//  PunisherAppDelegate.h
//  Punisher
//
//  Created by Виталий on 22.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebSocketListener;
@class PunisherViewController;

@interface PunisherAppDelegate : NSObject <UIApplicationDelegate>

@property(nonatomic, retain) IBOutlet UIWindow *window;

@property(nonatomic, retain) IBOutlet PunisherViewController *viewController;

@property(nonatomic, retain) IBOutlet WebSocketListener *webSocketListner;

@end
