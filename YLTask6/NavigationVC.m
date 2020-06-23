//
//  NavigationVC.m
//  YLTask6
//
//  Created by Юлия Лопатина on 6/21/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import "NavigationVC.h"
#import "UIColor+RSColors.h"
#import "TabViewController.h"
#import "InfoViewController.h"
#import "GalleryViewController.h"
#import "HomeViewController.h"

@interface NavigationVC ()
@property (strong, nonatomic) UIButton *startButton;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIView *mainView;
@property (strong, nonatomic) UIStackView *containerStackView;
@property (strong, nonatomic) UIScreen *mainScreen;
@property (strong, nonatomic) UIView *triangleView;
@property (strong, nonatomic) UIView *squareView;
@property (strong, nonatomic) UIView *circleView;
@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation NavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.toolbarHidden = YES;
    //self.navigationBarHidden = YES;
    [self figures];
    [self makeLabel];
    [self buttonSettings];
    [self setUpStack];
    
}

- (void)viewDidAppear:(BOOL)animated {
    #pragma mark Animations
      [UIView animateWithDuration:1
                         delay:0
                         options: UIViewAnimationOptionRepeat
                       animations:^{ [self.triangleView setTransform:CGAffineTransformMakeRotation(360)];
                                    }
                       completion:^(BOOL finished) {
                                                    }];
      
         
    [UIView animateWithDuration:1
                            delay:0
                            options:  UIViewAnimationOptionAutoreverse |UIViewAnimationOptionRepeat
                     animations:^{
        self.squareView.center = CGPointMake(self.squareView.center.x, self.squareView.center.y + self.squareView.frame.size.width * 0.1);
        self.squareView.center = CGPointMake(self.squareView.center.x, self.squareView.center.y - self.squareView.frame.size.width * 0.1);
    }
                          completion:^(BOOL finished) {
                                                       }];
         
    
  CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
  animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
  animation.fromValue = [NSNumber numberWithFloat:0.9];
  animation.toValue = [NSNumber numberWithFloat:1];
  animation.duration = 1.0;
   animation.repeatCount=HUGE_VALF;
  [self.circleView.layer addAnimation:animation forKey:@"scale"];
  //[animation.layer setCornerRadius:0.0];
  
}
   
-(void) makeLabel {
    self.label = [[UILabel alloc]init];
    self.label.text = @"Are you ready?";
    self.label.font = [UIFont systemFontOfSize:24 weight:UIFontWeightMedium];
    [self.view addSubview:self.label];
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
       [NSLayoutConstraint activateConstraints:@[
           //[self.label.topAnchor constraintEqualToAnchor:self.view.topAnchor],
           [self.label.bottomAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:-200],
           [self.label.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor]
       ]];
}
-(void) figures {
    #pragma mark Circle
    self.circleView = [[UIView alloc] init];
       self.circleView.layer.cornerRadius = 35;
       self.circleView.backgroundColor = [UIColor rsschoolRedColor];
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
     
-(void) setUpStack {
    self.containerStackView = [[UIStackView alloc]init];

    [self.containerStackView addArrangedSubview:self.circleView];
    [self.containerStackView addArrangedSubview:self.squareView];
    [self.containerStackView addArrangedSubview:self.triangleView];
    
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
    
    self.containerStackView.axis = UILayoutConstraintAxisHorizontal;
    self.containerStackView.distribution = UIStackViewDistributionEqualCentering;
    self.containerStackView.alignment = UIStackViewAlignmentCenter;
    [self.view addSubview:self.containerStackView];
  
   self.containerStackView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [self.containerStackView.topAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:-70],
        [self.containerStackView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.containerStackView.widthAnchor constraintEqualToConstant:300]
        /*[self.containerStackView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:50],
        [self.containerStackView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-50],*/
       
    ]];
    
}

-(void) buttonSettings {
    self.startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.startButton.frame = CGRectMake(50.0, 500.0, 300.0, 50.0);
    self.startButton.backgroundColor = [UIColor rsschoolYellowColor];
    [self.startButton setTitle:@"START" forState:UIControlStateNormal];
    [self.startButton setTitleColor:[UIColor rsschoolBlackColor] forState:UIControlStateNormal];
    self.startButton.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    //self.startButton.clipsToBounds = YES;
    self.startButton.layer.cornerRadius = 55.0/2.0f;
    [self.startButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.startButton];
    
   self.startButton.translatesAutoresizingMaskIntoConstraints = NO;
         [NSLayoutConstraint activateConstraints:@[
             [self.startButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
             [self.startButton.topAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:140],
             [self.startButton.heightAnchor constraintEqualToConstant:55],
             [self.startButton.widthAnchor constraintEqualToConstant:300],
         ]];
    


}

-(void) buttonPressed {

    UIViewController *tab1 = [InfoViewController new];
    tab1.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"info_unselected"] selectedImage:[[UIImage imageNamed:@"info_selected"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal]];
    
    GalleryViewController *tab2 = [GalleryViewController new];
    
    tab2.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"gallery_unselected"] selectedImage:[[UIImage imageNamed:@"gallery_selected"]imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal]];

       HomeViewController *tab3 = [HomeViewController new];
       tab3.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"home_selected"] selectedImage:[[UIImage imageNamed:@"home_selected"]imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal]];

       TabViewController *tabBarController = [TabViewController new];
      tabBarController.viewControllers = @[tab1, tab2, tab3];
    
     tabBarController.selectedIndex = 1;
    
   [self.navigationController pushViewController:tabBarController animated:YES];
   
    
}



@end
