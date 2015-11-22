//
//  FriendsHelperMethods.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 19/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "FriendsHelperMethods.h"

@implementation FriendsHelperMethods



-(BOOL)checkIsUserMyFriends:(PFUser *)sendingUser andArray:(NSArray*)allFriends{
    int control = 0;
    for(PFUser *controlUser in allFriends) {
        if([controlUser.objectId isEqual:sendingUser.objectId]) {
            control = 1;
        }
    }
    
    if(control == 1) {
        return true;
    } else {
        return false;
    }
}

@end
