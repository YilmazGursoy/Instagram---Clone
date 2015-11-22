//
//  ServerFriendEditing.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 20/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "ServerFriendEditing.h"
#import "AppConstants.h"

@implementation ServerFriendEditing


-(void)sendFriendsRequestToUser:(PFUser *)user{
    NSString *requests = @"istek";
    NSString *sendText = @"Seni bu alemde takip etmek istiyorum";
    
    NSData* data = [sendText dataUsingEncoding:NSUTF8StringEncoding];
    
    PFFile *file = [PFFile fileWithName:requests data:data];
    
    [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if(error) {
            NSLog(@"There is an error SendAddFriendRequestHelper.h");
        } else {
            
            PFObject *message = [PFObject objectWithClassName:@"Requests"];
            
            [message setObject:file forKey:@"file"];
            
            [message setObject:user.objectId forKey:@"receipentsID"];
            
            [message setObject:[PFUser currentUser].objectId forKey:@"senderID"];
            
            [message setObject:[PFUser currentUser] forKey:@"senderUser"];
            
            [message saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                if(error) {
                    [self.delegate controlIsSendSuccessful:false];
                } else {
                    [self.delegate controlIsSendSuccessful:true];
                }
            }];
        }
    }];
}

-(void)isISendRequestThisUser:(PFUser*)someoneUser{
    
    PFQuery *waitingRequests = [PFUser query];

    [waitingRequests orderByAscending:WaitingRequestsListID];
    
    NSError *error = nil;
    
    [waitingRequests getObjectInBackgroundWithId:someoneUser.objectId block:^(PFObject * _Nullable object, NSError * _Nullable error) {
        if(error) {
            NSLog(@"There is an error : -(BOOL)isISendRequestThisUser:(PFUser*)someoneUser");
            [self.delegate controlIfISendRequest:false];
        } else {
            [self.delegate controlIfISendRequest:true];
        }
    }];
}

@end
