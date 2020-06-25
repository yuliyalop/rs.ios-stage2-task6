//
//  CollectionViewCell.m
//  YLTask6
//
//  Created by Юлия Лопатина on 6/24/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

-(instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        //[self setUpImageView];
    }
    return self;
}

-(void) setUpImageView {
    self.imageView = [UIImageView new];
    self.imageView.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubview:self.imageView];
    [NSLayoutConstraint activateConstraints:@[
        [self.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
        [self.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [self.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
    ]];
}
@end
