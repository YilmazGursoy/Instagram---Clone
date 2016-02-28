//
//  ProfileAcceptCancelViewController.h
//  
//
//  Created by Yilmaz  on 26/11/15.
//
//

#import "ServerOneUser.h"
#import "BaseViewController.h"
#import "ServerUserRelation.h"
#import "SendAddFriendRequestHelper.h"
#import "ServerRequestsList.h"
#import "RequestListHelperMethods.h"

@interface ProfileAcceptCancelViewController : BaseViewController <ServerOneUserDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *requestSenderUserProfilePicture;
@property (strong, nonatomic) IBOutlet UILabel *requestSenderUsername;
@property (strong, nonatomic) IBOutlet UITextView *requestSenderUserMessage;
@property (strong, nonatomic) PFUser *showingUser;
@property (strong, nonatomic) NSString *sendingMessage;
@property (strong, nonatomic) ServerOneUser *serverOneUserObject;
@property (strong, nonatomic) ServerUserRelation *serverUserRelation;
@property (strong, nonatomic) ServerRequestsList *serverRequestListObject;

- (IBAction)acceptButtonPressed:(UIButton *)sender;
- (IBAction)hideButtonPressed:(UIButton *)sender;

/**
 *  Açılmasını istedigimiz profileIn set edildigi metottur
 *
 *  @param user gösterilecek PFUser
 *
 *  @return donus tipi instancetype
 */
-(instancetype)initWithObject:(PFUser*)user AndMessages:(NSString*)message;

@end
