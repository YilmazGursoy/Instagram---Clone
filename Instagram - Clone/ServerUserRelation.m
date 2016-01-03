//
//  CreateUserRelationHelperClass.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 02/01/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "ServerUserRelation.h"

@implementation ServerUserRelation

-(void)createUserRelationFromMeTo:(PFUser *)nextUser{
    
    PFUser *currentUser = [PFUser currentUser];
    
    self.friendsRelation = [currentUser relationForKey:@"friendsRelation"];
    
    [self.friendsRelation addObject:nextUser];
    
    [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
       
        if(error) {
            
            NSLog(@"There is an error : -(void)createUserRelationFromMeTo:(PFUser *)nextUser");
        
        } else {
            
            NSLog(@"Congrats you have a new friend");
        
        }
        
    }];

}

@end
