//
//  TabViewController.m
//  YLTask6
//
//  Created by Юлия Лопатина on 6/22/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import "TabViewController.h"
#import "UIColor+RSColors.h"
@interface TabViewController ()

@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor rsschoolWhiteColor];
  

}
- (void)viewDidLayoutSubviews {
      [self setTabBarHeight];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.navigationItem setHidesBackButton:YES animated:YES];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self.navigationController setNavigationBarHidden:NO animated:YES]; 
}

- (void)setTabBarHeight {
   
}

@end
