//
//  Created by Vitaliy Ruzhnikov on 03.12.11.
//
//
//


#import "MiniGame.h"

@protocol GameCompletionMessenger <NSObject>
- (void)showGameOver:(GameState)gameState;
@end