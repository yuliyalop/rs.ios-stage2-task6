//
//  AppDelegate.m
//  YLTask6
//
//  Created by Юлия Лопатина on 6/21/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import "AppDelegate.h"
#import "NavigationVC.h"
#import "UIColor+RSColors.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.mainWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
   UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:[NavigationVC new]];
    [self.mainWindow makeKeyAndVisible];
    self.mainWindow.rootViewController= navigationController;
        [navigationController setNavigationBarHidden:YES animated:NO];
    [UINavigationBar appearance].barTintColor = [UIColor rsschoolYellowColor];
    return YES;
}

//- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
//    UIWindow *window = [[UIWindow alloc]initWithWindowScene:(UIWindowScene *)scene];
//    window.rootViewController = [self rootViewController];
//    self.window = window;
//    [self.window makeKeyAndVisible];
//}
//
//- (UIViewController *) rootViewController {
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[NavigationVC new]];
//    [navigationController setNavigationBarHidden:YES animated:NO];
//    [UINavigationBar appearance].barTintColor = [UIColor rsschoolYellowColor];
//    return navigationController;
//}



@end
