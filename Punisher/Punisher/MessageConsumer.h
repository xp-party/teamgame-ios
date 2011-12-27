//
//  Created by Vitaliy Ruzhnikov on 22.10.11.
//
//
//

@protocol MessageConsumer

- (void)consumeMessage:(NSDictionary *)message;

@end