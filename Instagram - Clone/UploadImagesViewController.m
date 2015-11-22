//
//  UploadImagesViewController.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 21/10/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "UploadImagesViewController.h"
#import "ImagesHelperMethods.h"
@interface UploadImagesViewController ()

@property (nonatomic) BOOL Control;
@property (strong, nonatomic) ImagesHelperMethods *imageHelper;
@property (strong, nonatomic) UIImage *shotingImage;
@property (weak, nonatomic) IBOutlet UIButton *uploadButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *cancelButtonOutlet;

@end

@implementation UploadImagesViewController

-(ImagesHelperMethods *)imageHelper{
    if(!_imageHelper) {
        _imageHelper = [[ImagesHelperMethods alloc]init];
    }
    return _imageHelper;
}

-(ImagePickerControllerHelperMethod *)helperImagePickerController{
    if(!_helperImagePickerController) {
        _helperImagePickerController = [[ImagePickerControllerHelperMethod alloc]init];
    }
    return _helperImagePickerController;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if(_Control) {
        self.helperImagePickerController.delegate = self;
        
        [self.helperImagePickerController presentImagePickerControllerAndGetImage:self];
        
        _Control = false;
    
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.helperImagePickerController.delegate = self;
    [self.helperImagePickerController presentImagePickerControllerAndGetImage:self];
    _Control = false;
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self restoreUploadViewControllerisRestore:true];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)imageSelectingSuccesfull:(UIImage *)image{
    [self restoreUploadViewControllerisRestore:false];
    self.shotingImage = image;
    [self.confirmShotingImageView setImage:self.shotingImage];
    [self showAlertMessage:@"Bu resmi upload etmek istiyormusunuz ? " andPop:true];
}
-(void)didFailed{
    self.Control = true;
    [self.tabBarController setSelectedIndex:0];
}
- (IBAction)cancelButtonPressed {
    [self restoreUploadViewControllerisRestore:true];
    [self.tabBarController setSelectedIndex:0];
}
- (IBAction)uploadButtonPressed {

#warning Resim resizing Yapılacak

}

#pragma mark- HelperFunc

-(void)restoreUploadViewControllerisRestore:(BOOL)control{
    if(control) {
        [self.confirmShotingImageView setImage:nil];
        self.uploadButtonOutlet.hidden = true;
        self.cancelButtonOutlet.hidden = true;
        self.Control = true;
    } else {
        self.uploadButtonOutlet.hidden = false;
        self.cancelButtonOutlet.hidden = false;
        self.Control = false;
    }
}
@end
