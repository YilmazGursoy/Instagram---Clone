//
//  UserInstallationHelper.m
//  Instagram - Clone
//
//  Created by Yilmaz  on 27/02/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "UserInstallationHelper.h"

@implementation UserInstallationHelper

+(void)setupUserInstallation{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL control = [defaults objectForKey:UserInstallationDefaults];
    if(control) {
        
        NSLog(@"User Installation doesnt work because its already use before");
        
    } else {

            PFInstallation *installation = [PFInstallation currentInstallation];
            installation[@"user"] = [PFUser currentUser];
            [installation saveInBackground];
            [defaults setBool:YES forKey:UserInstallationDefaults];
            [defaults synchronize];
        }
}


+(void)deleteUserInstallationID{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL control = [defaults objectForKey:UserInstallationDefaults];
    if(control) {
        
        [defaults removeObjectForKey:UserInstallationDefaults];
        [defaults synchronize];

    }
}
@end
