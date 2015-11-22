//
//  ImagesHelperMethods.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 17/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImagesHelperMethods : NSObject

/**
 *  Çekilmiş olan yada kütüphaneden alınmış olan image'in size'ini default size a göre ayarlar buda normalin 1/10' u kadardır
 *
 *  @param image  resize yapılacak image
 *  @param width  yeni image'in genişlik değeri önerilen image.size.width/10.0
 *  @param height yeni image'in yükseklik değeri önerilen image.size.height/10.0
 *
 *  @return resize yapılmış image
 */
-(UIImage*)resizeImage:(UIImage*)image toWidth:(float)width andHeight:(float)height;
@end
