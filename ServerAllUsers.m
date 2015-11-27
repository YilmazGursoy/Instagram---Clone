//
//  ServerAllUsers.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 18/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "ServerAllUsers.h"
#import "BaseViewController.h"

@implementation ServerAllUsers

-(instancetype)initWithDelegate:(id<ServerAllUserDelegate>)delegate{
    if(self){
        self.delegate = delegate;
        [self getAllUserInformations];
        return self;
    }
    return false;
}

-(void)getAllUserInformations{

    PFQuery *query = [PFUser query];
    
    [query orderByAscending:@"Username"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if(error) {
            [_delegate getAllUsersResponseFailed];
        } else {
        
            [_delegate getAllUsersResponseSuccess:objects];
        
        }
    }];
}

@end
