//
//  CollectionViewCell.m
//  YLTask6
//
//  Created by Юлия Лопатина on 6/24/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import "CollectionViewCell.h"
@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupImageView];
    }
    return self;
}


-(void) setupImageView{
    self.imageView=[UIImageView new];
    self.imageView.translatesAutoresizingMaskIntoConstraints=NO;
    self.imageView.userInteractionEnabled = NO;
    [self addSubview:self.imageView];
    
    [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor].active=YES;
    [self.imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active=YES;
    [self.imageView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active=YES;
    [self.imageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active=YES;
    
    
}
@end
