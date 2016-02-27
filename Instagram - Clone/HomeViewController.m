//
//  HomeViewController.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 21/10/15.
//  Copyright © 2015 Yilmaz . All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if([PFUser currentUser] != nil) {
        [[PFUser currentUser] fetch];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if([PFUser currentUser]) {
        [self showAlertMessage:@"Zaten oturumunuz açık" andPop:false];
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
