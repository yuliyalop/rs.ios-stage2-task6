//
//  SceneDelegate.m
//  YLTask6
//
//  Created by Юлия Лопатина on 6/21/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import "SceneDelegate.h"
#import "NavigationVC.h"
#import "UIColor+RSColors.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    self.window = [[UIWindow alloc]initWithWindowScene:(UIWindowScene *)scene];
    NavigationVC *VC = [[NavigationVC alloc]init];
    //[UINavigationBar appearance].barTintColor = [UIColor rsschoolYellowColor];
    self.window.backgroundColor = [UIColor rsschoolWhiteColor];
    UINavigationController *NC = [[UINavigationController alloc] initWithRootViewController:VC];
    NC.navigationBar.barTintColor = [UIColor rsschoolYellowColor];
    self.window.rootViewController = NC;
    //self.window = window;
    [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
