//
//  ServerOneUser.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 27/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Server.h"
@protocol ServerOneUserDelegate<NSObject>

@optional

/**
 *  getThisUserInformation metodunun delegate' i istenen user' ın bilgilerini döndürür
 *
 *  @param user Bilgisi istenilen PFUser
 */
-(void)succededGetUserInformation:(PFUser*)user;

/**
 *  Istek te bir sorun oluştu
 */
-(void)failedGetUserInformation;

@end

@interface ServerOneUser : Server <ServerOneUserDelegate>

@property (strong, nonatomic) id<ServerOneUserDelegate> delegate;


/**
 *  Yalnızca bir tane user' ın verilerine erişilmesini sağlar
 *
 *  @param user verilerine ulaşılmak istenen user
 */
-(void)getThisUserInformation:(PFUser*)user;

/**
 *  Metot hem initialize eder hem delegate cagirir
 *
 *  @param delegate gondermek istenilen deegate default: self
 *
 *  @return donus tipi: self
 */
-(instancetype)initWithDelegate:(id<ServerOneUserDelegate>)delegate;

@end
