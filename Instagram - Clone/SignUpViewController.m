//
//  SignUpViewController.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 21/10/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "SignUpViewController.h"
#import "ImagesHelperMethods.h"



@interface SignUpViewController ()

    @property (strong, nonatomic) UIImage *profileImage;
    @property (strong, nonatomic) ImagesHelperMethods *changeImageSizeHelper;
@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.changeImageSizeHelper = [[ImagesHelperMethods alloc]init];
    self.imagePickerHelperObject = [[ImagePickerControllerHelperMethod alloc]init];
    self.imagePickerHelperObject.delegate = self;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

- (IBAction)signUpButtonPressed:(UIButton *)sender {
    if(self.usernameTextField.text.length == 0 || self.passwordTextField.text.length == 0 || self.passwordTextField.text.length == 0 || self.emailTextField.text.length == 0) {
        
        [self showAlertMessage:@"Lütfen Geçerli alanları boş bırakmayınız" andPop:false];
    
    }else if(![self.passwordTextField.text isEqualToString:self.passwordAgainTextField.text]){
    
        [self showAlertMessage:@"Lütfen şifrenizi doğlu yazdığınızdan emin olunuz şifreler uyuşmuyor" andPop:false];
        self.passwordAgainTextField.text = @"";
        self.passwordTextField.text = @"";

    } else {
    
        PFUser *newUser = [PFUser user];
        newUser.username = self.usernameTextField.text;
        newUser.password = self.passwordTextField.text;
        newUser.email = self.emailTextField.text;

        NSData *imageData = UIImagePNGRepresentation(self.profileImage);
        PFFile *imageFile = [PFFile fileWithName:@"profileImage.png" data:imageData];
        [imageFile saveInBackground];

        [newUser setObject:self.profileDescTextField.text forKey:ProfileDescKey];
        
        [newUser setObject:imageFile forKey:ProfilePictureKey];
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            if(error) {
                [self showAlertMessage:[NSString stringWithFormat:@"Üyeliğinizde bir sorun oluştu, %@",error] andPop:false];
            }else {
                [self showAlertMessage:@"Tebrikler üyeliğiniz gerçekleşmiştir" andPop:true];
            }
        }];
    }
}
- (IBAction)addProfilePictureButtonPressed {
    [self.imagePickerHelperObject presentImagePickerControllerAndGetImage:self];
}

#pragma mark - ImagePickerHelper Delegate methods

-(void)didFailed{
    
}

-(void)imageSelectingSuccesfull:(UIImage *)image{

    self.profileImage = [self.changeImageSizeHelper resizeImage:image toWidth:(float)image.size.width/10.0 andHeight:(float)image.size.height/10.0];
    [self.profileImageView setImage:image];
    [self.profileImageAddButton setHidden:true];

}

@end
