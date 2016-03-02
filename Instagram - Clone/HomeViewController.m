//
//  HomeViewController.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 21/10/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "HomeViewController.h"
#import "ServerUserRelation+ServerReceivedAcceptFromReceipentUser.h"

@interface HomeViewController ()

@property (strong, nonatomic) ServerUserRelation *userRelation;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    if([PFUser currentUser] != nil) {
        [self showAlertMessage:@"Zaten oturumunuz açık" andPop:false];
        self.userRelation = [[ServerUserRelation alloc]init];
        [self.userRelation controlIfAcceptOrNotUserRequests];
        [[PFUser currentUser] fetch];
    } else {
        [self performSegueWithIdentifier:@"LoginVCSegue" sender:nil];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
