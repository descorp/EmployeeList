//
//  AppDelegate.m
//  EmployeeList
//
//  Created by Vladimir Abramichev on 18/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import "AppDelegate.h"
#import "EmployeeListViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    EmployeeDirectory *datasource = [[EmployeeDirectory new] init];
    UIViewController *viewController = [[EmployeeListViewController new] initWithEmployeeDataSource:datasource];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];

    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
