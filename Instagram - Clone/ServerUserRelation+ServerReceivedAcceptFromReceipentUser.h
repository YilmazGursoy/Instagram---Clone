//
//  ServerUserRelation+ServerReceivedAcceptFromReceipentUser.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 29/02/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "ServerUserRelation.h"

@interface ServerUserRelation (ServerReceivedAcceptFromReceipentUser)


/**
 *  Kullanıcılara gonderilen isteklere kullanıcıların verdigi cevaplara gore [PFUser currentUser] objesinin PFRelation kismi yönetilir - Ya da eğer kullanıcı bizi arkadaşlarından çıkarırsa bu metot devreye girer ve bizim de çıkarmamızı sağlar
 */
-(void)controlIfAcceptOrNotUserRequests;

@end
