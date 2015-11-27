//
//  ServerAllUsers.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 18/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Server.h"

@protocol ServerAllUserDelegate <NSObject>

@optional
-(void)getAllUsersResponseSuccess:(NSArray*)allUsers;
-(void)getAllUsersResponseFailed;
@end


@interface ServerAllUsers : Server

/**
*  Metot hem initialize eder hem delegate i initialize eder hemde getAllUser metodunu çağırır.
*
*  @param delegate kullanmak istedigimiz delegate
*
*  @return dönüş tipi instancetype
*/
-(instancetype)initWithDelegate:(id<ServerAllUserDelegate>)delegate;


@property (strong, nonatomic) id<ServerAllUserDelegate> delegate;

@end
