//
//  RequestListHelperMethods.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 03/01/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SendAddFriendRequestHelper.h"
#import <Parse/Parse.h>

@interface RequestListHelperMethods : SendAddFriendRequestHelper


/**
 *  Tum gonderilen waitingRequest listelerinin güncellenmesi için ve request listelerinin güncellenmesi için direk olarak waiting request key inden almak yerine buradan alınmalıdır
 *
 *  @return Yeni waiting request arrayi
 */
+(NSMutableArray*)getSendingRequestUserList;


/**
 *  Tum degisikliklerin parse backendinde yazılmasını saglar
 *
 *  @param currentList Parse backendine yazılacak yeni liste
 */
+(void)setAllChangesParseBackend:(NSMutableArray*)currentList;

@end
