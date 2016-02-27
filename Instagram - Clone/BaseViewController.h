//
//  BaseViewController.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 21/10/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "AppConstants.h"
#import "UserInstallationHelper.h"

@interface BaseViewController : UIViewController
/**
*  Bu fonksiyon programın herhangi biryerinde alertView oluşturup ekrana basmamız için tasarlanmış bir helper methodtur.
*
*  @param message Mesaj kullanıcının ekrana alert olarak bastırmak istedigi text metnidir
*/
-(void)showAlertMessage:(NSString*)message andPop:(BOOL)isPop;

/**
 *  Bu fonksiyon nerede olunursa olunsun sayfanın pop yapılmasına yaramaktadır
 *
 *  @param sender Button değeri null olarak atanabilir
 */
- (IBAction)pop:(UIButton *)sender;


/**
 *  Bu fonksiyon hangi user' ın profiline erişilmek isteniliyorsa o user' ın profiline erişilmesini sağlar
 *
 *  @param user Profile viewController ' ına eleman olarak gönderilecek user objesini atar
 */
-(void)openUserProfile:(PFUser*)user;
@end
