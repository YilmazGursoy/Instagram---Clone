//
//  ServerRequestsList.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 25/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Server.h"

@protocol ServerRequestListDelegate<NSObject>


@optional

/**
 *  Delegate method request atan kullanıcıların listesini dönmektedir
 *
 *  @param requestsList Request atan kullanıcıların listesi
 */
-(void)succededAllRequestsList:(NSArray*)requestsList;

/**
 *  Request atan arkadaşların bulunmasında hata oluşursa bu fonksiyon devreye girer
 */
-(void)failedAllRequestsList;

@end



@interface ServerRequestsList : Server < ServerRequestListDelegate>


/**
 *  Fonksiyon current kullanıcıya request atan tum kullanıcıların listesini göstermektedir ve initialize yapmaktadır
 *
 *  @param delegate delegate yapılacak object
 *
 *  @return  donus instancetype
 */
-(instancetype)initWithDelegate:(id<ServerRequestListDelegate>)delegate;

@property (strong, nonatomic) id<ServerRequestListDelegate> delegate;

@end
