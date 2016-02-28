//
//  BaseViewController.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 21/10/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "BaseViewController.h"
#import "ProfileViewController.h"


@interface BaseViewController (){
    PFUser *sendingUser;
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if([PFUser currentUser] != nil) {
        [UserInstallationHelper setupUserInstallation];
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showAlertMessage:(NSString*)message andPop:(BOOL)isPop{
    
    UIAlertController *alertController = [[UIAlertController alloc]init];
    
    [alertController setMessage:message];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Tamam" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //TODO:
        if(isPop) {
            [self pop:nil];
        }
    }];
 
    [alertController addAction:alertAction];
    
    [self presentViewController:alertController animated:true completion:nil];
}

- (IBAction)pop:(UIButton *)sender {
    
    [self dismissModalViewControllerAnimated:true];

}

-(void)openUserProfile:(PFUser*)user {
    sendingUser = user;

    ProfileViewController *prof = [self.storyboard instantiateViewControllerWithIdentifier:ProfileViewControllerID];
    prof.controlUser = sendingUser;
    [self.navigationController pushViewController:prof animated:true];
    
}
@end
