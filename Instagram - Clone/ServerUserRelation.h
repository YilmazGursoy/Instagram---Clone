//
//  CreateUserRelationHelperClass.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 02/01/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewController.h"
#import "Server.h"


@interface ServerUserRelation : Server

@property (strong, nonatomic) PFRelation *friendsRelation;

/**
 *  Fonksiyon Userlar arasında bir PFRelation bağının oluşturulması işlemine yaramaktadır
 *
 *  @param nextUser PFRelation oluşturumak istenen user
 */
-(void)createUserRelationFromMeTo:(PFUser*)nextUser;


/**
 *  Fonksiyon current user ile deletinUser arasında oluşturulmuş olan PFRelation yapısını silmektedir
 *
 *  @param deletingUser PFRelation dan silinecek User
 */
-(void)deleteThisUserRelationFromMe:(PFUser*)deletingUser;


@end
