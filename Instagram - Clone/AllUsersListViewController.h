//
//  AllUsersListViewController.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 18/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "BaseViewController.h"
#import "ServerAllUsers.h"

@interface AllUsersListViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate, ServerAllUserDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ServerAllUsers *allUsersObject;
@property (strong, nonatomic) NSArray *allUsersArray;
@end
