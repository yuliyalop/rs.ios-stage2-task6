//
//  InfoTableViewCell.h
//  YLTask6
//
//  Created by Юлия Лопатина on 7/11/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Photos;
NS_ASSUME_NONNULL_BEGIN

@interface InfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *subtitle;

@end

NS_ASSUME_NONNULL_END
