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
#import "ServerUserRelation.h"

typedef enum{
    Cikis,
    Cikar,
    Ekle,
    Beklemede
}ButtonNames;

@interface ProfileViewController : BaseViewController < ServerFriendsListDelegate , UIImagePickerControllerDelegate, ImagePickerHelper, SendAddFriendsRequestDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *profileImageview;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionLabel;
@property (strong, nonatomic) IBOutlet UIButton *logoutOrAddRemoveFriendsButton;
@property (strong, nonatomic) IBOutlet UILabel *percentageDone;
@property (strong, nonatomic) IBOutlet UIButton *friendsListBarButton;
@property (nonatomic) ButtonNames *buttonNames;

//Profile i açılan currentuser mi specific user mı onu belirtir,
@property (strong, nonatomic) PFUser *controlUser;

@property (strong, nonatomic) ServerUserRelation *userRelationDeleteObject;

/**
 *  Arkadaşlarım butonuna basıldıgı zaman direk olarak yeni bir ViewController açılarak tüm ilişkili olunan User lar gosterilmektedir
 */
- (IBAction)allRelationFriendsList:(UIButton *)sender;

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
