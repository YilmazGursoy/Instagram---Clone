//
//  ServerRequestsList.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 25/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "ServerRequestsList.h"


@implementation ServerRequestsList

-(instancetype)initWithDelegate:(id<ServerRequestListDelegate>)delegate{
    if(self) {
        self.delegate = delegate;
        [self getRequestsUsers];
        return self;
    }
    return self;
}

-(void)getRequestsUsers{
    PFQuery *query = [PFQuery queryWithClassName:@"Requests"];
    
    [query orderByAscending:@"senderName"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if(error) {
            [_delegate failedAllRequestsList];
        } else {
            [self controlJustCurrentUser:objects];
        }
    }];
}

-(void)controlJustCurrentUser:(NSArray*)objects{
    NSMutableArray *lists = [[NSMutableArray alloc]init];
    for(PFObject *object in objects) {
        if([object[@"receipentsID"] isEqualToString:[PFUser currentUser].objectId]) {
            [lists addObject:object];
        }
    }
    [_delegate succededAllRequestsList:lists];
}

@end
