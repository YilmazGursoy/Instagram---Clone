//
//  ServerUserRelation+ServerSendAcceptToSenderUser.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 28/02/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "ServerUserRelation+ServerSendAcceptToSenderUser.h"

@implementation ServerUserRelation (ServerSendAcceptToSenderUser)



-(void)sendMessageFromMeToThisUser:(PFUser*)senderUser AndisAccept:(BOOL)boolean{
    NSString *requests = @"Kabul";
    
    NSString *sendText = @"Seni Takip Ediyorum Artık";
    
    NSData* data = [sendText dataUsingEncoding:NSUTF8StringEncoding];
    
    PFFile *file = [PFFile fileWithName:requests data:data];
    
    [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if(error) {
            NSLog(@"There is an error SendAddFriendRequestHelper.h");
        } else {
            
            PFObject *message = [PFObject objectWithClassName:UserAcceptRequestWarningID];
            
            [message setObject:file forKey:@"file"];
            
            [message setObject:@(boolean) forKey:@"isAccept"];
            
            [message setObject:senderUser.objectId forKey:@"receipentsID"];
            
            [message setObject:[PFUser currentUser] forKey:@"senderUser"];
            
            [message saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                if(error) {
                    
                    NSLog(@" Error  =   -(void)sendAcceptMessageFromMeToThisUser:(PFUser*)senderUser");
                    
                } else {
                    
                    NSLog(@" Kabul ettigimiz Sisteme kaydedildi!! ");
                }
            }];
        }
    }];



}



@end
