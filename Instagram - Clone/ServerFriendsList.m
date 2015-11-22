//
//  ServerFriendsList.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 19/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "ServerFriendsList.h"

@interface ServerFriendsList()

    @property (strong, nonatomic) PFRelation *friendsRelation;

@end

@implementation ServerFriendsList

-(void)getAllFriends{
    
    self.friendsRelation = [[PFUser currentUser] objectForKey:FriendsRelationID];
    if(self.friendsRelation) {
    PFQuery *query = [self.friendsRelation query];
    
    [query orderByAscending:@"username"];

    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
       
        if(error) {
            NSLog(@"There is an error, ServerList.h");
            [_delegate getServerFriendsListFailed];
        } else {
            [_delegate getServerFriendsListSuccess:objects];
        }
        
    }];
    }
    else {
        [_delegate getServerFriendsListFailed];
    }
}
@end
