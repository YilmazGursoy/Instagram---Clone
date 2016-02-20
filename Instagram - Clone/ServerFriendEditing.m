//
//  ServerFriendEditing.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 20/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "ServerFriendEditing.h"
#import "RequestListHelperMethods.h"
@interface ServerFriendEditing()< RequestListHelperMethodDelegate > {
    NSArray *waitingList;
    PFUser *_someoneUser;
}


@end

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

-(void)isISendRequestThisUser:(PFUser*)someoneUser{
//#error Fonskiyon tamamlanıldı artık istek attıklarını kontrol ediyor şimdi de yalnızca karşı kullanıcının onaylayıp ardından bu kullanıcının o onaya göre kendi listesini güncellemesini isteyecegiz bunun için bir tane requests adında bir yapı oluşturacagız ve bu yapıda alan kısmından biz kendi ID mizi sorgulatacagız ve eşleşme olunca o objenin boolean sonucuna bakacagız boolean sonuca göre de listemizi güncelleyecegiz

    _someoneUser = someoneUser;
    
    
    RequestListHelperMethods *requestListObject = [[RequestListHelperMethods alloc]initWithDelegate:self];
    
    if(![requestListObject getStaticUserList]) {
        
        [requestListObject getSendingRequestUserListWithControl:true];

    } else {
    
        [self getAllUserListsFromParseBackend:[requestListObject getStaticUserList] control:true];
    
    }
    
    
    
}
-(void)getAllUserListsFromParseBackend:(NSMutableArray *)allUsers control:(BOOL)boolean{
    int control = 0;
    for(NSString *ID in allUsers) {
        if([ID isEqualToString:_someoneUser.objectId]) {
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
