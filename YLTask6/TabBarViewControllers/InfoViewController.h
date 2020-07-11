//
//  InfoViewController.h
//  YLTask6
//
//  Created by Юлия Лопатина on 6/22/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "InfoTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface InfoViewController : UINavigationController <UITableViewDelegate, UITableViewDataSource>
@property(nonatomic , strong) PHCachingImageManager *imageManager;
@end

NS_ASSUME_NONNULL_END
