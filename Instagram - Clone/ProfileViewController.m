//
//  ProfileViewController.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 21/10/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "ProfileViewController.h"
#import "FriendsHelperMethods.h"



@interface ProfileViewController ()
@property (strong, nonatomic) ServerFriendsList *friendsListServer;
@property (strong, nonatomic) FriendsHelperMethods *friendsListHelper;
@property (strong, nonatomic) SendAddFriendRequestHelper *sendAddFriendsRequestObject;
@property (strong, nonatomic) ServerFriendEditing *serverFriendEditingObject;
@property (strong, nonatomic) NSArray *friendsList;
@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(self.controlUser == nil) {
        [self showUserProfile:[PFUser currentUser]];
        [self setButtonTitle:0];
    }
    else {
        [self userNotMeSetUpAllDelegates];
    }
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.controlUser = nil;
}
- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)profileSpecificButtonPressed {
    if([self.logoutOrAddRemoveFriendsButton.currentTitle isEqualToString:@"Çıkış"]) {
        [PFUser logOut];
        [self.tabBarController setSelectedIndex:0];
    } else if([self.logoutOrAddRemoveFriendsButton.currentTitle isEqualToString:@"Ekle"]) {
        [self.serverFriendEditingObject sendFriendsRequestToUser:self.controlUser];
        [self.sendAddFriendsRequestObject addRequestListToThisUser:self.controlUser];
            //kullanıcıya mesaj atılacak
        
    } else if([self.logoutOrAddRemoveFriendsButton.currentTitle isEqualToString:@"Çıkar"]) {

            //TODO://kullanıcı ile oluşturulmuş olan PFRelation  yapısı kaldırılacak,
    
    } else {
        NSLog(@"Bu kullanıcıya zaten bir istek atmışsınız daha birşey yapamazsınız");
    }
}
- (IBAction)changeProfileImageButtonPressed:(UIButton *)sender {
    self.imagePickerHelperObject = [[ImagePickerControllerHelperMethod alloc]init];
    self.imagePickerHelperObject.delegate = self;

}

#pragma mark - ImagePickerCOntrollerDelegate


-(void)imageSelectingSuccesfull:(UIImage *)image{
    

}
#pragma mark - ServerFriendsListDelegate

-(void)getServerFriendsListSuccess:(NSArray *)array{
    [self showUserProfile:self.controlUser];
    if(array.count > 0) {
        if([self.friendsListHelper checkIsUserMyFriends:self.controlUser andArray:array]) {
            [self setButtonTitle:1];
        }
    } else {
        [self showAlertMessage:@"Hiç arkadaşınız bulunmamaktadır" andPop:true];
        [self setButtonTitle:2];
    }
}

-(void)getServerFriendsListFailed{
    [self showUserProfile:self.controlUser];
}
#pragma mark - SendAddFriendsRequestDelegate

-(void)controlIsSendSuccessful:(BOOL)boolean{
    if(boolean) {
        [self.logoutOrAddRemoveFriendsButton setTitle:@"Beklemede" forState:UIControlStateNormal];
        [self.logoutOrAddRemoveFriendsButton setEnabled:false];
    }
}

-(void)controlIfISendRequest:(BOOL)boolean{
    if(boolean) {
        [self setButtonTitle:3];
    } else {
        [self setButtonTitle:2];
    }
}

#pragma mark - SetUpUI

-(void)userNotMeSetUpAllDelegates{
    self.friendsListHelper = [[FriendsHelperMethods alloc]init];
    self.friendsListServer = [[ServerFriendsList alloc]initWithDelegate:self];
    self.serverFriendEditingObject = [[ServerFriendEditing alloc]initWithDelegate:self];
    self.sendAddFriendsRequestObject = [[SendAddFriendRequestHelper alloc]init];
    //TODO:Burası classlara bağlı yapılacak
    [self.serverFriendEditingObject isISendRequestThisUser:self.controlUser];
    
}
-(void)showUserProfile:(PFUser*)user{
    
    self.usernameLabel.text = user.username;
    
    self.descriptionLabel.text = [user objectForKey:ProfileDescKey];
    
    PFFile *imageFile = [user objectForKey:ProfilePictureKey];
    self.percentageDone.text = @"0";
    self.percentageDone.hidden = false;
    [imageFile getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
        if(!error) {
            self.profileImageview.image = [UIImage imageWithData:data];
        } else {
            [self showAlertMessage:@"Profil Fotoğrafı yüklenirken bir hata oluştu" andPop:false];
        }
    } progressBlock:^(int percentDone) {
        self.percentageDone.text = [NSString stringWithFormat:@"%i",percentDone];
        if(percentDone == 100) {
            self.percentageDone.hidden = true;
            self.logoutOrAddRemoveFriendsButton.hidden = false;
        }
    }];
}

#pragma mark - UIHelper

/**
 *  FOnskiyon enum deger ataması yapmaktadır
 *
 *  @param title 0 = Cıkıs, 1 = Cıkar, 2 = Ekle, 3 = Beklemede
 */
-(void)setButtonTitle:(int)title{
    ButtonNames names = title;
    switch (names) {
        case Cikis:
            [self.logoutOrAddRemoveFriendsButton setTitle:@"Çıkış" forState:UIControlStateNormal];
        break;
         case Cikar:
            [self.logoutOrAddRemoveFriendsButton setTitle:@"Çıkar" forState:UIControlStateNormal];
        break;
        case Ekle:
            [self.logoutOrAddRemoveFriendsButton setTitle:@"Ekle" forState:UIControlStateNormal];
        break;
        case Beklemede:
            [self.logoutOrAddRemoveFriendsButton setTitle:@"Beklemede" forState:UIControlStateNormal];
            self.logoutOrAddRemoveFriendsButton.enabled = false;
        break;
        default:
            NSLog(@"Hicbiri ile eşleştirilemesi");
            break;
    }
    

}
@end