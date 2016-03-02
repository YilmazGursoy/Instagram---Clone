//
//  CreateUserRelationHelperClass.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 02/01/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "ServerUserRelation.h"
#import "RequestListHelperMethods.h"
#import "ServerUserRelation+ServerSendAcceptToSenderUser.h"

@implementation ServerUserRelation

-(void)createUserRelationFromMeTo:(PFUser *)nextUser{
    
    PFUser *currentUser = [PFUser currentUser];
    
    self.friendsRelation = [currentUser relationForKey:FriendsRelationID];
    
    [self.friendsRelation addObject:nextUser];
    
    [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
       
        if(error) {
            
            NSLog(@"There is an error : -(void)createUserRelationFromMeTo:(PFUser *)nextUser");
        
        } else {
            
            NSLog(@"Congrats you have a new friend");
            [RequestListHelperMethods removeUserFromRequestLists:nextUser];
            [self sendMessageFromMeToThisUser:nextUser AndisAccept:true];
        }
        
    }];

}

-(void)deleteThisUserRelationFromMe:(PFUser*)deletingUser{
    
    self.friendsRelation = [[PFUser currentUser] relationForKey:FriendsRelationID];
    
    [self.friendsRelation removeObject:deletingUser];
    
    [[PFUser currentUser] saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
       
        if(error) {
        
            NSLog(@"There is an error : deleteThisUserRelationFromMe:(PFUser*)deletingUser");
            
        } else {
            
            NSLog(@"Congrats you delete %@ user",deletingUser.username);
            [self sendMessageFromMeToThisUser:deletingUser AndisAccept:false];
            
        }
        
    }];

}

@end