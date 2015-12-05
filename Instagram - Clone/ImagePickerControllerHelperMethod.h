//
//  ImagePickerControllerHelperMethod.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 22/10/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewController.h"
/**
 *  ImagePickerDelegate Image Picker ile yapılmak istenen tüm işlemleri yapan ve iki adet methoda sahip olan bir protocol dür
 */
@protocol ImagePickerHelper <NSObject>
/**
 *  kullanıcı eğer imagepicker' controller açıldıktan sonra cancel butonuna basarsa bu metot tetiklenir
 */
-(void)didFailed;

/**
 *  ImagepickerController tarafından eğer bir resim seçilirse cancel vb butonlara basılmadan doğrudan bu metot tetiklenir ve seçilmiş olan image instance olarak verilir.
 *
 *  @param image Delegate methodundan donen profil resmi
 */
-(void)imageSelectingSuccesfull:(UIImage*)image;

@end



@interface ImagePickerControllerHelperMethod : BaseViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate, ImagePickerHelper>
/**
 *  Bu method profil fotografı değiştirme butonuna basıldığı zaman gerçekleştirilecek işlemleri yapan bir helper method' tur.
 */
-(void)presentImagePickerControllerAndGetImage:(UIViewController*)vc;
@property (strong, nonatomic) id<ImagePickerHelper> delegate;

/**
 *  Init methodu
 *
 *  @param delegate gondermek istediginiz delegate method
 *
 *  @return donus tipi self, instancetype
 */
-(instancetype)initWithDelegate:(id<ImagePickerHelper>)delegate;
@end
