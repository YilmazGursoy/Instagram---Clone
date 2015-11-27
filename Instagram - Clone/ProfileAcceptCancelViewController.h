//
//  ProfileAcceptCancelViewController.h
//  
//
//  Created by Yilmaz  on 26/11/15.
//
//

#import "ServerOneUser.h"
#import "BaseViewController.h"

@interface ProfileAcceptCancelViewController : BaseViewController <ServerOneUserDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *requestSenderUserProfilePicture;
@property (strong, nonatomic) IBOutlet UILabel *requestSenderUsername;
@property (strong, nonatomic) IBOutlet UITextView *requestSenderUserMessage;
@property (strong, nonatomic) PFUser *showingUser;
@property (strong, nonatomic) ServerOneUser *serverOneUserObject;

- (IBAction)acceptButtonPressed:(UIButton *)sender;
- (IBAction)hideButtonPressed:(UIButton *)sender;

/**
 *  Açılmasını istedigimiz profileIn set edildigi metottur
 *
 *  @param user gösterilecek PFUser
 *
 *  @return donus tipi instancetype
 */
-(instancetype)initWithObject:(PFUser*)user;

@end
