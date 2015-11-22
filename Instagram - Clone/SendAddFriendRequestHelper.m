//
//  SendAddFriendRequestHelper.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 20/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "SendAddFriendRequestHelper.h"
#import "AppConstants.h"
#import "ServerFriendEditing.h"

@implementation SendAddFriendRequestHelper


//Public helper methods

-(void)addRequestListToThisUser:(PFUser*)user{
    
    NSMutableArray *currentWaitingRequestsList = [self getSendingRequestUserList];
    if(!currentWaitingRequestsList) {
        currentWaitingRequestsList = [[NSMutableArray alloc]init];
    }
    
    [currentWaitingRequestsList addObject:user.objectId];
    
    [self setAllChangesParseBackend:currentWaitingRequestsList];
    
}
-(void)removeRequestListToThisUser:(PFUser*)user{

    NSMutableArray *currentWaitingRequestsList = [self getSendingRequestUserList];
    
    [currentWaitingRequestsList removeObject:user.objectId];
    
    [self setAllChangesParseBackend:currentWaitingRequestsList];

}

-(void)controlRequestList:(PFUser*)user{
    ServerFriendEditing *editingFriend = [[ServerFriendEditing alloc]init];
    
    [editingFriend isISendRequestThisUser:user];

}


//Private helper methods

-(NSMutableArray*)getSendingRequestUserList{
    
    
    PFUser *currentUser = [PFUser currentUser];
    
    NSMutableArray * array = [currentUser objectForKey:WaitingRequestsListID];
    
    
    return array;
    
}

-(void)setAllChangesParseBackend:(NSMutableArray*)currentList{
    
    PFUser *currentUser = [PFUser currentUser];
    
    [currentUser setObject:currentList forKey:WaitingRequestsListID];
    
    [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if(error) {
            NSLog(@"There is an error : -(void)addRequestListToThisUser:(PFUser*)user");
        } else {
            NSLog(@"Request listesine obje yükleme başarılı");
        }
    }];
}


@end
