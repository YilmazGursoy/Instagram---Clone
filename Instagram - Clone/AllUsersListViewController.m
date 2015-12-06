//
//  AllUsersListViewController.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 18/11/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "AllUsersListViewController.h"
#import "ProfileViewController.h"
#import "UsersProfileViewController.h"

@interface AllUsersListViewController ()
@end

@implementation AllUsersListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.allUsersObject = [[ServerAllUsers alloc]initWithDelegate:self];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setupDelegatesAndSendRequest];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.allUsersArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendsCell" forIndexPath:indexPath];
    cell.imageView.image = nil;
    PFUser *user = self.allUsersArray[indexPath.row];
    if(![[PFUser currentUser].objectId isEqual:user.objectId]) {
        cell.textLabel.text = user.username;
    }
    PFFile *littleProfileImage = [user objectForKey:ProfileLittlePictureKey];
    [littleProfileImage getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
        UIImage *littleImage = [UIImage imageWithData:data];
        if(!error){
            if (littleImage) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    UITableViewCell *updateCell = (id)[tableView cellForRowAtIndexPath:indexPath];
                    if (updateCell)
                        updateCell.imageView.image = littleImage;
                        [updateCell setNeedsLayout];
                });
            }
            }
        }];
    return cell;
}

-(void)getAllUsersResponseSuccess:(NSArray *)allUsers{
    
    NSMutableArray *allUsersWihoutMe = [[NSMutableArray alloc]init];
    
    for(PFUser *user in allUsers) {
        if(![[PFUser currentUser].objectId isEqual:user.objectId]) {
            [allUsersWihoutMe addObject:user];
        }
    }
    self.allUsersArray = allUsersWihoutMe;
    [self.tableView reloadData];
    
    
}
-(void)getAllUsersResponseFailed{
    [self showAlertMessage:@"Kullanıcılara erişilirken bir problem gerçekleşti" andPop:false];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    PFUser *sendingUser = self.allUsersArray[indexPath.row];
    [self openUserProfile:sendingUser];
    
}
-(void)setupDelegatesAndSendRequest{
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
}
@end

