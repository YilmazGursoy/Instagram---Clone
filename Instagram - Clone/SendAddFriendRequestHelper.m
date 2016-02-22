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
#import "RequestListHelperMethods.h"
@interface SendAddFriendRequestHelper()<RequestListHelperMethodDelegate>
@property (strong, nonatomic) PFUser *controlUser;
@property (strong, nonatomic) RequestListHelperMethods *requestHelperObject;
@end

@implementation SendAddFriendRequestHelper


//Public helper methods

-(void)addRequestListToThisUser:(PFUser*)user{

    _requestHelperObject = [[RequestListHelperMethods alloc]initWithDelegate:self];

    _controlUser = user;
    
    [_requestHelperObject getSendingRequestUserListWithControl:true];
    
}
-(void)removeRequestListToThisUser:(PFUser*)user{

    _requestHelperObject = [[RequestListHelperMethods alloc]initWithDelegate:self];
    
    _controlUser = user;
    
    [_requestHelperObject getSendingRequestUserListWithControl:false];
}

//Private helper methods

-(void)getAllUserListsFromParseBackend:(NSMutableArray *)allUsers control:(BOOL)boolean{
    
    NSMutableArray *availableAllUserArray = allUsers;
    
    if(boolean){
        if(!availableAllUserArray) {
            availableAllUserArray = [[NSMutableArray alloc]init];
        }
        
        [availableAllUserArray addObject:_controlUser.objectId];
        if(![availableAllUserArray containsObject:_controlUser.objectId]) {
            [_requestHelperObject setAllChangesParseBackend:availableAllUserArray withControl:true];
        }

 
    } else {
        
        [availableAllUserArray removeObject:_controlUser.objectId];
        
        if(![availableAllUserArray containsObject:_controlUser.objectId]) {
            
            [_requestHelperObject setAllChangesParseBackend:availableAllUserArray withControl:false];
        
        }

        
        
    }
}


-(void)sendUserPushNotificationToRequest:(PFUser *)sendingUser{

    // Create our Installation query
    PFQuery *pushQuery = [PFInstallation query];
    [pushQuery whereKey:@"user" equalTo:sendingUser[@"user"]];
    
    // Send push notification to query
    PFPush *push = [[PFPush alloc] init];
    [push setQuery:pushQuery]; // Set our Installation query
    [push setMessage:[NSString stringWithFormat:@"Merhaba %@ seni arkadaş olarak eklemek istiyorum :)",sendingUser.username]];
    [push sendPushInBackground];

}

@end
