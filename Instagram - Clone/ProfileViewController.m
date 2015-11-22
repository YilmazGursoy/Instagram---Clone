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
        [self logoutButtonShow];
    }
    else {
        self.friendsListHelper = [[FriendsHelperMethods alloc]init];
        self.friendsListServer = [[ServerFriendsList alloc]init];
        self.serverFriendEditingObject = [[ServerFriendEditing alloc]init];
        self.sendAddFriendsRequestObject = [[SendAddFriendRequestHelper alloc]init];
        self.friendsListServer.delegate = self;
        [self.friendsListServer getAllFriends];
        [self.sendAddFriendsRequestObject controlRequestList:self.controlUser];
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
        self.serverFriendEditingObject.delegate = self;
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
//#error Burada bir hata var ve sebebi muhtemelen istekler sırasında sonsuz döngü falan oluyor ve program currentUserProfile:(PFUser*)user fonksiyonunu çağırmıyor, kontrol edilecek
    [self showUserProfile:self.controlUser];
    if(array.count > 0) {
        if([self.friendsListHelper checkIsUserMyFriends:self.controlUser andArray:array]) {
            [self removeFriendsButtonShow];
        } else {
            [self addFriendsButtonShow];
        }
    } else {
        [self showAlertMessage:@"Hiç arkadaşınız bulunmamaktadır" andPop:true];
        [self addFriendsButtonShow];
    }
    
    
}

-(void)getServerFriendsListFailed{
    [self showUserProfile:self.controlUser];
    [self addFriendsButtonShow];
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
        [self waitingButtonShow];
    } else {
        [self addFriendsButtonShow];
    }
}

#pragma mark - SetUpUI

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
        }
    }];
}

#pragma mark - UIHelper

-(void)logoutButtonShow{
    [self.logoutOrAddRemoveFriendsButton setTitle:@"Çıkış" forState:UIControlStateNormal];
}
-(void)removeFriendsButtonShow{
    [self.logoutOrAddRemoveFriendsButton setTitle:@"Çıkar" forState:UIControlStateNormal];
}
-(void)addFriendsButtonShow{
    [self.logoutOrAddRemoveFriendsButton setTitle:@"Ekle" forState:UIControlStateNormal];
}
-(void)waitingButtonShow{
    [self.logoutOrAddRemoveFriendsButton setTitle:@"Beklemede" forState:UIControlStateNormal];
    self.logoutOrAddRemoveFriendsButton.enabled = false;
}
@end