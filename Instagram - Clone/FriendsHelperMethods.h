//
//  FriendsHelperMethods.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 19/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerFriendsList.h"
#import <Parse/Parse.h>

@interface FriendsHelperMethods : NSObject < ServerFriendsListDelegate >

@property (nonatomic) BOOL isSuccess;
@property (strong, nonatomic) ServerFriendsList *friendsList;


/**
 *  Metot göndermiş oldugumuz genel bir kullanıcının bizim arkadaşımız oluğ olmadıgını kontrol etmektedir
 *
 *  @param sendingUser Kontrol edilecek user
 *  @param allFriends  Tüm arkadaşlarımızın listesi
 *
 *  @return eger kullanıcı arkadaşımız ise true döner arkadaşımız değilse false döner
 */
-(BOOL)checkIsUserMyFriends:(PFUser *)sendingUser andArray:(NSArray*)allFriends;

@end
