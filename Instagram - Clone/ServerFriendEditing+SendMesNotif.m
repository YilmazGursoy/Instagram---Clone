//
//  ServerFriendEditing+SendNotification.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 20/02/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "ServerFriendEditing+SendMesNotif.h"

@implementation ServerFriendEditing (SendMesNotif)

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
            
            [message setObject:[PFUser currentUser].username forKey:@"senderName"];
            
            [message setObject:user.objectId forKey:@"receipentsID"];
            
            [message setObject:[PFUser currentUser].objectId forKey:@"senderID"];
            
            [message setObject:[PFUser currentUser] forKey:@"senderUser"];
            
            [message saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                if(error) {
                    [self.delegate controlIsSendSuccessful:false];
                } else {
                    [self.pushNotificationObject sendUserPushNotificationToRequest:user];
                    [self.delegate controlIsSendSuccessful:true];
                }
            }];
        }
    }];
    
}


@end
