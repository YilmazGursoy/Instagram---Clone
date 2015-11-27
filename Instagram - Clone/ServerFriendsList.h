//
//  ServerFriendsList.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 19/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Server.h"


@protocol ServerFriendsListDelegate <NSObject>

@optional
/**
 *  Fonksiyon serverfriendsList classının request attıgı tüm arkadaşlar metodunun cevabı olarak geleceği protocol metodudur
 *
 *  @param array tüm arkadaşlar
 */
-(void)getServerFriendsListSuccess:(NSArray*)array;

/**
 *  serverfriendsList classının request attıgı tüm arkadaşlar metodunun cevabı olmadıgını bir hata ile karşılaşıldıgını bildirir
 */
-(void)getServerFriendsListFailed;
@end


//Interface

@interface ServerFriendsList : Server < ServerFriendsListDelegate >

@property (strong, nonatomic) id<ServerFriendsListDelegate> delegate;




/**
 *  İnitialize ve delegate yapısı oluşturulur
 *
 *  @param delegate kullanılacak delegate ataması default = self
 *
 *  @return donus tipi instancetype
 */
-(instancetype)initWithDelegate:(id<ServerFriendsListDelegate>)delegate;


@end
