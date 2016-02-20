//
//  ServerFriendEditing+SendNotification.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 20/02/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "ServerFriendEditing.h"

@interface ServerFriendEditing (SendMesNotif)

/**
 *  Herhangi bir kullanıcıya arkadaşlık isteği atmamıza yarar
 *
 *  @param user İstek atmak istediğimiz kullanıcı
 */
-(void)sendFriendsRequestToUser:(PFUser*)user;



@end
