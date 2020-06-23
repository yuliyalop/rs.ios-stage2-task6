//
//  HomeViewController.h
//  YLTask6
//
//  Created by Юлия Лопатина on 6/22/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UINavigationController
@property (strong, nonatomic) UIButton *gitButton;
@property (strong, nonatomic) UIButton *resetButton;
@property (strong, nonatomic) UILabel *apple;
@property (strong, nonatomic) UIStackView *stackView;
@property (strong, nonatomic) UIView *triangleView;
@property (strong, nonatomic) UIView *squareView;
@property (strong, nonatomic) UIView *circleView;

@end

NS_ASSUME_NONNULL_END
