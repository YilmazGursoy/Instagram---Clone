//
//  CreateUserRelationHelperClass.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 02/01/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewController.h"


@interface ServerUserRelation : NSObject

@property (strong, nonatomic) PFRelation *friendsRelation;

/**
 *  Fonksiyon Userlar arasında bir PFRelation bağının oluşturulması işlemine yaramaktadır
 *
 *  @param nextUser PFRelation oluşturumak istenen user
 */
-(void)createUserRelationFromMeTo:(PFUser*)nextUser;

/**
 *  Fonksiyon istek gonderen kullanıcının istegi reddedildigi zaman request classından isteginin silinmesine yarar
 *
 *  @param user istegi silinecek olan kullanıcı
 */
-(void)deleteUserRequestFromRequests:(PFUser*)user;

@end
