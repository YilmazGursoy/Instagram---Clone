//
//  LoginViewController.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 21/10/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginButtonPressed:(UIButton *)sender {
    if(self.usernameTextField.text.length == 0 || self.passwordTextField.text.length == 0) {
        [self showAlertMessage:@"Lütfen alanları boş bırakmayınız" andPop:false];
    } else {
        [PFUser logInWithUsernameInBackground:self.usernameTextField.text password:self.passwordTextField.text block:^(PFUser * _Nullable user, NSError * _Nullable error) {
            if(error) {
                [self showAlertMessage:@"Kullanıcı adı yada şifreniz hatalı" andPop:false];
            } else {
                [self showAlertMessage:@"Tebrikler başarı ile giriş yaptınız" andPop:true];
            }
        }];
    
    }
}
@end
