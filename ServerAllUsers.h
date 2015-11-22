//
//  ServerAllUsers.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 18/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ServerAllUserDelegate <NSObject>

@optional
-(void)getAllUsersResponseSuccess:(NSArray*)allUsers;
-(void)getAllUsersResponseFailed;
@end


@interface ServerAllUsers : NSObject

-(void)getAllUserInformations;
@property (strong, nonatomic) id<ServerAllUserDelegate> delegate;

@end
