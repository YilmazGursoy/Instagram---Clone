//
//  FriendsActivityViewController.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 21/10/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ServerRequestsList.h"
#import "ProfileAcceptCancelViewController.h"

@interface FriendsActivityViewController : BaseViewController < UITableViewDelegate, UITableViewDataSource, ServerRequestListDelegate >


@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ServerRequestsList *requestList;
@property (strong, nonatomic) ProfileAcceptCancelViewController *acceptCancelVC;

@end
