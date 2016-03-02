//
//  ProfileAcceptCancelViewController.m
//  
//
//  Created by Yilmaz  on 26/11/15.
//
//

#import "ProfileAcceptCancelViewController.h"
#import "FriendsActivityViewController.h"
#import "ServerUserRelation+ServerSendAcceptToSenderUser.h"

@interface ProfileAcceptCancelViewController ()

@end

@implementation ProfileAcceptCancelViewController
-(instancetype)initWithObject:(PFUser *)user AndMessages:(NSString *)message{
    self.showingUser = user;
    self.sendingMessage = message;
    self.serverOneUserObject = [[ServerOneUser alloc]initWithDelegate:self];
    self.serverUserRelation = [[ServerUserRelation alloc]init];
    self.serverRequestListObject = [[ServerRequestsList alloc]init];
    if(self)
        return self;
    else
        return 0;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.serverOneUserObject getThisUserInformation:self.showingUser];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)acceptButtonPressed:(UIButton *)sender {
    
    [self.serverUserRelation createUserRelationFromMeTo:self.showingUser isReceived:false];
    
}

- (IBAction)hideButtonPressed:(UIButton *)sender {
    
    [RequestListHelperMethods removeUserFromRequestLists:self.showingUser];
    
}

#pragma mark - ServerOneUserDelegate

-(void)succededGetUserInformation:(PFUser *)user{
    self.showingUser = user;
    [self setUpUI];
}

-(void)failedGetUserInformation{
    [self showAlertMessage:@"Kullanıcı profiline erişilirken bir problem ile karşılaşıldı" andPop:true];
}


#pragma mark - SetUpUI

-(void)setUpUI{
    self.requestSenderUsername.text = self.showingUser.username;
    self.requestSenderUserMessage.text = self.sendingMessage;
    PFFile *profileImage = self.showingUser[ProfilePictureKey];
    [profileImage getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
        if(error) {
            [self showAlertMessage:@"Profil Fotografı yüklenirken bir hata ile karşılaşıldı" andPop:false];
        } else {
            self.requestSenderUserProfilePicture.image = [UIImage imageWithData:data];
        }
    }];
}

@end
