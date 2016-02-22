//
//  ServerOneUser.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 27/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "ServerOneUser.h"

@implementation ServerOneUser

-(instancetype)initWithDelegate:(id<ServerOneUserDelegate>)delegate{
    if(self) {
        self.delegate = delegate;
        return self;
    }else {
        return false;
    }
}

-(void)getThisUserInformation:(PFUser*)user{
    
    PFQuery *query = [PFUser query];
    
    [query whereKey:@"objectId" equalTo:user.objectId];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if(error) {
            [self.delegate failedGetUserInformation];
        } else {
            if(objects.count <= 1) {
                for(PFUser *user in objects) {
                    [self.delegate succededGetUserInformation:user];
                }
            }
        }
    }];


    
    
}

@end
