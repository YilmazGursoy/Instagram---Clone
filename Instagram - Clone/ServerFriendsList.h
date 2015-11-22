//
//  ServerFriendsList.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 19/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "AppConstants.h"

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

@interface ServerFriendsList : NSObject < ServerFriendsListDelegate >

@property (strong, nonatomic) id<ServerFriendsListDelegate> delegate;

/**
 *  Bu metot bize PFRelation metodu ile bağlı olan güncel arkadaşlarımızı vermektedir
 */
-(void)getAllFriends;

@end
