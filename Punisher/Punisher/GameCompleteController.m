//
//  Created by Vitaliy Ruzhnikov on 03.12.11.
//
//
//


#import "GameCompleteController.h"


@implementation GameCompleteController {

}

- (void)showGameOver:(GameState)gameState {
    NSString *message = nil;
    if (gameState == WIN) {
        message = @"You win!";
    } else {
        message = @"You lose!";
    }

    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Game Over"
                                                        message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
    [alertView release];
}


@end