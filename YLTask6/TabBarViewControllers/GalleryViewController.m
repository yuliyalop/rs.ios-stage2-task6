//
//  GalleryViewController.m
//  YLTask6
//
//  Created by Юлия Лопатина on 6/22/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import "GalleryViewController.h"
#import "UIColor+RSColors.h"
#import "CollectionViewCell.h"
@implementation GalleryViewController
-(void)viewDidLoad {
    [super viewDidLoad];
    self.parentViewController.navigationItem.title = @"Gallery";
}

-(void)setUpCollection {
    self.collectionView = [[UICollectionView alloc] init];
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    //[self.collectionView registerClass:CollectionViewCell.class forCellReuseIdentifier:@"CellId"];
    [self.view addSubview:self.collectionView];
    [NSLayoutConstraint activateConstraints:@[
        [self.collectionView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.collectionView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.collectionView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.collectionView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ]];
}
/*
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView ;

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;



- (nullable UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath;

- (__kindof UICollectionViewCell *)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;*/

@end
