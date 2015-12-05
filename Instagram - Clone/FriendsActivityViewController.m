//
//  FriendsActivityViewController.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 21/10/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "FriendsActivityViewController.h"

@interface FriendsActivityViewController ()

@property (strong, nonatomic) NSArray *allRequests;

@end

@implementation FriendsActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.requestList = [[ServerRequestsList alloc]initWithDelegate:self];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate-DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.allRequests.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActivityFriendCellID" forIndexPath:indexPath];

    PFObject *object = self.allRequests[indexPath.row];
    
    cell.textLabel.text = object[@"senderName"];
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PFObject *selectedObject = self.allRequests[indexPath.row];
    PFUser *user = selectedObject[@"senderUser"];
    PFFile *file = selectedObject[@"file"];
    
    [file getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
        if(!error) {
            NSString *sendingMessage = [[NSString alloc]initWithData:data encoding:NSASCIIStringEncoding];
            ProfileAcceptCancelViewController *vc = [[ProfileAcceptCancelViewController alloc]initWithObject:user AndMessages:sendingMessage];
            [self.navigationController pushViewController:vc animated:true];
        }
    }];
    
    
}

#pragma mark - ServerRequestListDelegate
-(void)succededAllRequestsList:(NSArray *)requestsList{
    self.allRequests = requestsList;
    [self.tableView reloadData];
}
-(void)failedAllRequestsList{
    [self showAlertMessage:@"İsteklere erişirken hata ile karşılaşıldı" andPop:false];
}
@end
