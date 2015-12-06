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

@implementation SendAddFriendRequestHelper


//Public helper methods

-(void)addRequestListToThisUser:(PFUser*)user{
    
    NSMutableArray *currentWaitingRequestsList = [self getSendingRequestUserList];
    if(!currentWaitingRequestsList) {
        currentWaitingRequestsList = [[NSMutableArray alloc]init];
    }
    
    [currentWaitingRequestsList addObject:user.objectId];
    
    [self setAllChangesParseBackend:currentWaitingRequestsList];
    
}
-(void)removeRequestListToThisUser:(PFUser*)user{

    NSMutableArray *currentWaitingRequestsList = [self getSendingRequestUserList];
    
    [currentWaitingRequestsList removeObject:user.objectId];
    
    [self setAllChangesParseBackend:currentWaitingRequestsList];

}

-(void)controlRequestList:(PFUser*)user{
    
#warning Delegate metotlar ayarlanacak bir hata var hatanın sebebi muhtemelen ServerFriendEditing classında biz protocol çağırıyoruz ancak bu çağırma bizim helper classımızın içerisinde gerçekleşiyor ve bu yuzden biz ana programda birşey alamıyoruz
}


//Private helper methods

-(NSMutableArray*)getSendingRequestUserList{
    
    
    PFUser *currentUser = [PFUser currentUser];
    
    NSMutableArray * array = [currentUser objectForKey:WaitingRequestsListID];
    
    
    return array;
    
}

-(void)setAllChangesParseBackend:(NSMutableArray*)currentList{
    
    PFUser *currentUser = [PFUser currentUser];
    
    [currentUser setObject:currentList forKey:WaitingRequestsListID];
    
    [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if(error) {
            NSLog(@"There is an error : -(void)addRequestListToThisUser:(PFUser*)user");
        } else {
            NSLog(@"Request listesine obje yükleme başarılı");
        }
    }];
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
