//
//  Created by Vitaliy Ruzhnikov on 22.10.11.
//
//
//


@protocol MessageConsumerDelegate<NSObject>

- (void)didConsumeMessage:(NSString *)message;

@end