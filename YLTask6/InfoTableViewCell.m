//
//  InfoTableViewCell.m
//  YLTask6
//
//  Created by Юлия Лопатина on 6/22/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//


#import "InfoTableViewCell.h"
#import "ObjectItem.h"
@interface InfoTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *completedIndicatorView;

@end

@implementation InfoTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //[self setupViews];
    }
    return self;
}

- (void)configureWithObjectItem:(ObjectItem *)objectItem {
    self.titleLabel.text = objectItem.title;
    self.completedIndicatorView.hidden = !objectItem.completed;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
