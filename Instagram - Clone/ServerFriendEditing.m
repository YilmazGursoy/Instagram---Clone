//
//  ServerFriendEditing.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 20/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "ServerFriendEditing.h"
#import "RequestListHelperMethods.h"


@implementation ServerFriendEditing
-(instancetype)initWithDelegate:(id<SendAddFriendsRequestDelegate>)delegate{

    if(self){
        self.delegate = delegate;
        self.pushNotificationObject = [[SendAddFriendRequestHelper alloc]init];
        return self;
    }
    else {
        return false;
    }
}

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
                    [self.delegate controlIsSendSuccessful:true];
                }
            }];
        }
    }];
    
    [self.pushNotificationObject sendUserPushNotificationToRequest:user];
    
}

-(void)isISendRequestThisUser:(PFUser*)someoneUser{
//#error Fonskiyon tamamlanıldı artık istek attıklarını kontrol ediyor şimdi de yalnızca karşı kullanıcının onaylayıp ardından bu kullanıcının o onaya göre kendi listesini güncellemesini isteyecegiz bunun için bir tane requests adında bir yapı oluşturacagız ve bu yapıda alan kısmından biz kendi ID mizi sorgulatacagız ve eşleşme olunca o objenin boolean sonucuna bakacagız boolean sonuca göre de listemizi güncelleyecegiz
    PFUser *user = [PFUser currentUser];
    
    NSArray *waitingList = [RequestListHelperMethods getSendingRequestUserList];
    int control = 0;
    for(NSString *ID in waitingList) {
        if([ID isEqualToString:someoneUser.objectId]) {
            control = 1;
        }
    }
    
    if(control == 1) {
        [self.delegate controlIfISendRequest:true];
    } else {
        [self.delegate controlIfISendRequest:false];
    }
}

@end
