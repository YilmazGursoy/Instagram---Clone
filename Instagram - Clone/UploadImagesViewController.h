//
//  UploadImagesViewController.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 21/10/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ImagePickerControllerHelperMethod.h"
@interface UploadImagesViewController : BaseViewController <ImagePickerHelper>

@property (strong, nonatomic) ImagePickerControllerHelperMethod *helperImagePickerController;
@property (weak, nonatomic) IBOutlet UIImageView *confirmShotingImageView;

@end
