//
//  Created by Vitaliy Ruzhnikov on 03.12.11.
//
//
//


#import <Foundation/Foundation.h>
#import "GameCompletionMessenger.h"


@interface GameCompletionMessengerStub : NSObject<GameCompletionMessenger>

@property(readonly) BOOL called;


@end