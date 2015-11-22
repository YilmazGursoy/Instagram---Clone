//
//  ImagesHelperMethods.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 17/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "ImagesHelperMethods.h"

@implementation ImagesHelperMethods

-(UIImage*)resizeImage:(UIImage*)image toWidth:(float)width andHeight:(float)height{
    CGSize newsize = CGSizeMake(width, height);
    CGRect newRect = CGRectMake(0, 0, width, height);
    UIGraphicsBeginImageContext(newsize);
    
    [image drawInRect:newRect];
    
    UIImage *resizingImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return resizingImage;
}
@end
