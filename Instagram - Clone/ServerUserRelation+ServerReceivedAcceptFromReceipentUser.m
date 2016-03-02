//
//  ServerUserRelation+ServerReceivedAcceptFromReceipentUser.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 29/02/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "ServerUserRelation+ServerReceivedAcceptFromReceipentUser.h"

@implementation ServerUserRelation (ServerReceivedAcceptFromReceipentUser)

-(void)controlIfAcceptOrNotUserRequests{
    
    PFUser *currentUser = [PFUser currentUser];
    
    PFQuery *query = [PFQuery queryWithClassName:UserAcceptRequestWarningID];
    
    [query whereKey:@"receipentsID" equalTo:currentUser.objectId];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
       
        if(error) {
        
            NSLog(@"There is an error = -(void)controlIfAcceptOrNotUserRequests");
        
        } else {

            for( PFObject *newObject in objects ) {
                
                if(newObject[@"isAccept"]) {
                    //İstegimizi kabul etmiştir bildirimi gitmektedir
                    [self createUserRelationFromMeTo:newObject[@"senderUser"]];
                    [newObject deleteEventually];
                } else {
                    //Bizi arkadaşlıktan çıkarmıştır
                    [self deleteThisUserRelationFromMe:newObject[@"senderUser"]];
                    [newObject deleteEventually];
                }
            
            }
        
        }
        
    }];
}
@end
