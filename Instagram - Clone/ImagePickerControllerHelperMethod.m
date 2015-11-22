//
//  ImagePickerControllerHelperMethod.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 22/10/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "ImagePickerControllerHelperMethod.h"


@implementation ImagePickerControllerHelperMethod

-(void)presentImagePickerControllerAndGetImage:(UIViewController*)vc{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.delegate = self;
    
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [vc presentViewController:imagePicker animated:true completion:nil];
        
    } else if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [vc presentViewController:imagePicker animated:true completion:nil];
    } else {
        [self showAlertMessage:@"Lütfen uygulamanın fotoğraf larınıza erişmesi için yada fotoğraf çekebilmeniz için uygulamanın iznini ayarlardan açınız" andPop:false];
    }
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{

    [self.delegate didFailed];
    [picker dismissModalViewControllerAnimated:true];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    
    if(picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        //save image
        UIImageWriteToSavedPhotosAlbum([info objectForKey:UIImagePickerControllerOriginalImage], nil, nil, nil);
    }
    [self.delegate imageSelectingSuccesfull:[info objectForKey:UIImagePickerControllerOriginalImage]];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
}

@end
