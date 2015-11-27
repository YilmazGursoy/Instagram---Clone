//
//  ProfileAcceptCancelViewController.m
//  
//
//  Created by Yilmaz  on 26/11/15.
//
//

#import "ProfileAcceptCancelViewController.h"

@interface ProfileAcceptCancelViewController ()

@end

@implementation ProfileAcceptCancelViewController
-(instancetype)initWithObject:(PFUser *)user{
    self.showingUser = user;
    self.serverOneUserObject = [[ServerOneUser alloc]initWithDelegate:self];
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
}

- (IBAction)hideButtonPressed:(UIButton *)sender {
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
    self.requestSenderUserMessage.text = [self.showingUser objectForKey:@"ProfileDescKey"];
#error Yalnışlıkla istek ekranını atacagıma direk user profile' i atılmış burada ayrıca user'ın göndermiş oldugu sendDescription mesajıda eklenilecek bu mesaja o da ayrı alınabilir
}

@end
