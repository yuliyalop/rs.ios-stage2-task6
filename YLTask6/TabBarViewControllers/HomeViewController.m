//
//  HomeViewController.m
//  YLTask6
//
//  Created by Юлия Лопатина on 6/22/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import "HomeViewController.h"
#import "UIColor+RSColors.h"
#import "NavigationVC.h"
@implementation HomeViewController
-(void)viewDidLoad {
    [super viewDidLoad];
    [self figures];
    [self setUpStack];
    [self gitButtonSettings];
    [self resetButtonSettings];
    [self appleSetUp];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.parentViewController.navigationItem.title = @"RSSchool Task 6";
}
-(void) figures {
    #pragma mark Circle
    self.circleView = [UIView new];
       self.circleView.layer.cornerRadius = 35;
       self.circleView.backgroundColor = [UIColor rsschoolRedColor];
      // [self.view addSubview:self.circleView];
    #pragma mark Square
    self.squareView = [[UIView alloc]init];
       self.squareView.backgroundColor = [UIColor rsschoolBlueColor];
    #pragma mark Triangle
       UIBezierPath* trianglePath = [UIBezierPath bezierPath];
       [trianglePath moveToPoint:CGPointMake(35, 0)];
       [trianglePath addLineToPoint:CGPointMake(0, 70)];
       [trianglePath addLineToPoint:CGPointMake(70,70)];
       [trianglePath closePath];
       CAShapeLayer *triangleMaskLayer = [CAShapeLayer layer];
       [triangleMaskLayer setPath:trianglePath.CGPath];
       self.triangleView = [[UIView alloc] init];
       self.triangleView.backgroundColor = [UIColor rsschoolGreenColor];
       self.triangleView.layer.mask = triangleMaskLayer;
}


-(void) gitButtonSettings {
    self.gitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.gitButton.backgroundColor = [UIColor rsschoolYellowColor];
    [self.gitButton setTitle:@"Open Git CV" forState:UIControlStateNormal];
    [self.gitButton setTitleColor:[UIColor rsschoolBlackColor] forState:UIControlStateNormal];
    self.gitButton.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    self.gitButton.layer.cornerRadius = 55.0/2.0f;
    [self.gitButton addTarget:self action:@selector(gitButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.gitButton];
   self.gitButton.translatesAutoresizingMaskIntoConstraints = NO;
         [NSLayoutConstraint activateConstraints:@[
             [self.gitButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
             [self.gitButton.topAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:150],
             [self.gitButton.widthAnchor constraintEqualToConstant:300],
             [self.gitButton.heightAnchor constraintEqualToConstant:55]
         ]];
}
-(void) resetButtonSettings {
    self.resetButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.resetButton.backgroundColor = [UIColor rsschoolRedColor];
    [self.resetButton setTitle:@"Go to start!" forState:UIControlStateNormal];
    [self.resetButton setTitleColor:[UIColor rsschoolBlackColor] forState:UIControlStateNormal];
    self.resetButton.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    //self.startButton.clipsToBounds = YES;
    self.resetButton.layer.cornerRadius = 55.0/2.0f;
    [self.resetButton addTarget:self action:@selector(resetButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.resetButton];
   self.resetButton.translatesAutoresizingMaskIntoConstraints = NO;
     [NSLayoutConstraint activateConstraints:@[
             [self.resetButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
             [self.resetButton.topAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:230],
             [self.resetButton.widthAnchor constraintEqualToConstant:300],
             [self.resetButton.heightAnchor constraintEqualToConstant:55]
         ]];
}

-(void) gitButtonPressed {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/yuliyalop"] options:nil completionHandler:nil];
}

-(void) resetButtonPressed {
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void) setUpStack {
    self.stackView = [[UIStackView alloc]init];
    [self.stackView addArrangedSubview:self.circleView];
    [self.stackView addArrangedSubview:self.squareView];
    [self.stackView addArrangedSubview:self.triangleView];
    self.triangleView.translatesAutoresizingMaskIntoConstraints = NO;
        [NSLayoutConstraint activateConstraints:@[
            [self.triangleView.heightAnchor constraintEqualToConstant:70],
            [self.triangleView.widthAnchor constraintEqualToConstant:70]
        ]];
    self.circleView.translatesAutoresizingMaskIntoConstraints = NO;
           [NSLayoutConstraint activateConstraints:@[
               [self.circleView.heightAnchor constraintEqualToConstant:70],
            [self.circleView.widthAnchor constraintEqualToConstant:70]
           ]];
    self.triangleView.translatesAutoresizingMaskIntoConstraints = NO;
           [NSLayoutConstraint activateConstraints:@[
             [self.squareView.heightAnchor constraintEqualToConstant:70],
            [self.squareView.widthAnchor constraintEqualToConstant:70]
           ]];
    self.stackView.axis = UILayoutConstraintAxisHorizontal;
    self.stackView.distribution = UIStackViewDistributionEqualCentering;
    self.stackView.alignment = UIStackViewAlignmentCenter;
    [self.view addSubview:self.stackView];
   self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [self.stackView.topAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:-70],
        [self.stackView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.stackView.widthAnchor constraintEqualToConstant:300]
    ]];
    
}

-(void)appleSetUp {
    self.appleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple"]];
    [self.view addSubview:self.appleView];
    self.appleView.translatesAutoresizingMaskIntoConstraints = NO;
      [NSLayoutConstraint activateConstraints:@[
          [self.appleView.trailingAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:-70],
          [self.appleView.bottomAnchor constraintEqualToAnchor:self.stackView.topAnchor constant: -100],
      ]];
    self.nameLabel = [UILabel new];
    self.nameLabel.text = UIDevice.currentDevice.name;
    self.nameLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    [self.view addSubview:self.nameLabel];
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
       [NSLayoutConstraint activateConstraints:@[
           [self.nameLabel.topAnchor constraintEqualToAnchor:self.view.topAnchor constant: 200],
           [self.nameLabel.leftAnchor constraintEqualToAnchor:self.view.centerXAnchor constant: -30]
       ]];
    
    self.modelLabel = [UILabel new];
    self.modelLabel.text = UIDevice.currentDevice.model;
    self.modelLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    [self.view addSubview:self.modelLabel];
    self.modelLabel.translatesAutoresizingMaskIntoConstraints = NO;
       [NSLayoutConstraint activateConstraints:@[
           [self.modelLabel.topAnchor constraintEqualToAnchor:self.view.topAnchor constant: 230],
           [self.modelLabel.leftAnchor constraintEqualToAnchor:self.view.centerXAnchor constant: -30]
       ]];
    
    self.systemLabel = [UILabel new];
    self.systemLabel.text = UIDevice.currentDevice.systemName;
    self.systemLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    [self.view addSubview:self.systemLabel];
    self.systemLabel.translatesAutoresizingMaskIntoConstraints = NO;
       [NSLayoutConstraint activateConstraints:@[
           [self.systemLabel.topAnchor constraintEqualToAnchor:self.view.topAnchor constant: 260],
           [self.systemLabel.leftAnchor constraintEqualToAnchor:self.view.centerXAnchor constant: -30]
       ]];
      
}
@end
