//
//  ServerUserRelation+ServerSendAcceptToSenderUser.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 28/02/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "ServerUserRelation.h"

@interface ServerUserRelation (ServerSendAcceptToSenderUser)


/**
 *  Kullanıcı istek attığı zaman gelen istegi biz tamam dedigimizde aynı istek gibi bir mesaj kullanıcıya gitmeli ve kullanıcı bu mesaj ile de kendi relationOluşturmali
 *
 *  @param senderUser Kabul ettim sende beni ekle olarak gidecek private mesaj
 */
-(void)sendAcceptMessageFromMeToThisUser:(PFUser*)senderUser;

@end
