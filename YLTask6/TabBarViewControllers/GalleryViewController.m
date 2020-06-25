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
    [self setUpCollection];
}

-(void)setUpCollection {
    
    UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    collectionViewLayout.itemSize = CGSizeMake(self.view.frame.size.width / 3 - 10 , self.view.frame.size.width / 3 - 10 );
    collectionViewLayout.minimumLineSpacing = 5;
    collectionViewLayout.minimumInteritemSpacing = 5;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:collectionViewLayout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    self.collectionView.backgroundColor = [UIColor rsschoolWhiteColor];
    [self.view addSubview:self.collectionView];
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.parentViewController.navigationItem.title = @"Gallery";
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 40;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}

@end
