//
//  ServerFriendEditing.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 20/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
@protocol SendAddFriendsRequestDelegate <NSObject>

@optional

/**
 *  Bu delegate bize istek atılığ atılmadıgını ve bir hata çıkıp çıkmadığını göstermektedir,
 *
 *  @param boolean eğer bu ifade true ise o zaman istek gonderilmiştir, eğer false ise istek gönderirken hata oluşmuştur
 */
-(void)controlIsSendSuccessful:(BOOL)boolean;

/**
 *  Eğer current kullanıcı istek atmış mı onu belirtir
 *
 *  @param boolean  eğer istek atılmış ve beklemedeyse true döner aksi durumda false döner
 */
-(void)controlIfISendRequest:(BOOL)boolean;

@end

@interface ServerFriendEditing : NSObject
@property (strong, nonatomic) id<SendAddFriendsRequestDelegate> delegate;

/**
 *  Herhangi bir kullanıcıya arkadaşlık isteği atmamıza yarar
 *
 *  @param user İstek atmak istediğimiz kullanıcı
 */
-(void)sendFriendsRequestToUser:(PFUser*)user;


/**
 *  Bu fonksiyon herhangi bir kullanıcıya istek atıl atılmadıgını gösterir böylece eğer istek atılmışsa o kullanıcıya tekrar istek atma butonu aktif olmaz
 *
 *  @param someoneUser Istek atıp atmadıgımızı kontrol etmek istedigimiz user
 *
 *  @return eğer istek atmış isek ve istekten bir cevap gelmemiş ise bu ifade true doner ama eğer istek hiç atmadıysak o zamanda false döner,
 */
-(void)isISendRequestThisUser:(PFUser*)someoneUser;
@end
