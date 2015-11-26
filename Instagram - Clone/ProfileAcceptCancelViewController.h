//
//  ProfileAcceptCancelViewController.h
//  
//
//  Created by Yilmaz  on 26/11/15.
//
//

#import <UIKit/UIKit.h>

@interface ProfileAcceptCancelViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *requestSenderUserProfilePicture;
@property (strong, nonatomic) IBOutlet UILabel *requestSenderUsername;

@property (strong, nonatomic) IBOutlet UITextView *requestSenderUserMessage;
- (IBAction)acceptButtonPressed:(UIButton *)sender;

- (IBAction)hideButtonPressed:(UIButton *)sender;

@end
