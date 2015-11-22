//
//  SignUpViewController.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 21/10/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ImagePickerControllerHelperMethod.h"

@interface SignUpViewController : BaseViewController< UINavigationControllerDelegate ,UIImagePickerControllerDelegate, ImagePickerHelper>
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordAgainTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
- (IBAction)signUpButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *profileImageAddButton;
@property (weak, nonatomic) IBOutlet UITextField *profileDescTextField;

#pragma mark Delegate Instance
@property (strong, nonatomic) ImagePickerControllerHelperMethod *imagePickerHelperObject;

@end
