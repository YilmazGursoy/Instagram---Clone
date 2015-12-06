//
//  SendAddFriendRequestHelper.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 20/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>



@interface SendAddFriendRequestHelper : NSObject



/**
 *  Bu metot arkadaşlık isteği attığımız kişilere tekrar istek atamamamız için bir güvenlik metodudur ve istek attığımız kişinin ID' sini parse backendine kaydeder,
 *
 *  @param user istek atılan kullanıcı
 */
-(void)addRequestListToThisUser:(PFUser*)user;



/**
 *  Parse backendine yüklenmiş olan herhangi bir kullanıcıdan gelen istegin reddedilmesi yada kabul edilmesi durumunda bu metot çağrılır ve parse backendinden istek atılan kişinin ID' si silinir, bunu genellikle istegi alan kullanıcı yapmaktadır
 *
 *  @param user silinecek olan user bu parametre genellikle currentUser olacak
 */
-(void)removeRequestListToThisUser:(PFUser*)user;

/**
 *  Seçili user a herhangibir istek atıldımı onu belirtir
 *
 *  @param user Istek atılıp atılmadıgı kontrol edilecek user
 */
-(void)controlRequestList:(PFUser*)user;

/**
 *  Bu fonksiyon secilmiş olan kullanıcıya push notification atmamızı saglar
 *
 *  @param sendingUser push notification'un atılması istenen kullanıcı
 */
-(void)sendUserPushNotificationToRequest:(PFUser*)sendingUser;
@end
