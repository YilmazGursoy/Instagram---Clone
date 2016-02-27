//
//  UserInstallationHelper.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 27/02/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppConstants.h"
#import <Parse/Parse.h>

@interface UserInstallationHelper : NSObject

/**
 *  Kullanıcı cihaz ile ilk giriş yaptıgında o kullanıcıyı Parse sistemine cihaz ile birlikte yüklemeyi saglayan yapıdır
 */
+(void)setupUserInstallation;


/**
 *  Yeni bir kullanıcı ile giriş yapıldıgında yeni kullanıcıyı yeni cihaz olarak gormesi için defaults yapısını silen helper method' tur
 */
+(void)deleteUserInstallationID;

@end
