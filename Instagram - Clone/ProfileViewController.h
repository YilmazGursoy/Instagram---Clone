//
//  ProfileViewController.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 21/10/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ServerFriendsList.h"
#import "ImagePickerControllerHelperMethod.h"
#import "SendAddFriendRequestHelper.h"
#import "ServerFriendEditing.h"

@interface ProfileViewController : BaseViewController < ServerFriendsListDelegate , UIImagePickerControllerDelegate, ImagePickerHelper, SendAddFriendsRequestDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *profileImageview;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionLabel;
@property (strong, nonatomic) IBOutlet UIButton *logoutOrAddRemoveFriendsButton;
@property (strong, nonatomic) IBOutlet UILabel *percentageDone;


//Profile i açılan currentuser mi specific user mı onu belirtir,
@property (strong, nonatomic) PFUser *controlUser;


#pragma mark Delegate Instance
@property (strong, nonatomic) ImagePickerControllerHelperMethod *imagePickerHelperObject;
/**
 *  Profil resminin değiştirilmesini sağlayan yapıdır
 *
 *  @param sender sender button' un geliş verisidir
 */
- (IBAction)changeProfileImageButtonPressed:(UIButton *)sender;

/**
 *  Current user' in çıkış yapmasını sağlayan butondur
 */
- (IBAction)profileSpecificButtonPressed;

@end
