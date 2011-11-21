//
//  PunisherTests.h
//  PunisherTests
//
//  Created by Виталий on 22.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "ZTWebSocket.h"

@interface PunisherTests : SenTestCase<ZTWebSocketDelegate> {
@private
    ZTWebSocket *_webSocket;
    BOOL opened;
}
@property (nonatomic , retain) ZTWebSocket *webSocket;

@end
