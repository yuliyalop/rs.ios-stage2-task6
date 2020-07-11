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
#import <Photos/Photos.h>

@interface GalleryViewController ()
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) PHFetchResult *assetsFetchResult;
@property(nonatomic , strong) PHCachingImageManager *imageManager;
@end

@implementation GalleryViewController
-(void)viewDidLoad {
    [super viewDidLoad];
    [self setUpCollection];
    //self.fetchResult = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:0];
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    self.assetsFetchResult = [PHAsset fetchAssetsWithOptions:options];

    self.imageManager = [[PHCachingImageManager alloc] init];
       
}

-(void)setUpCollection {
    
    UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    collectionViewLayout.itemSize = CGSizeMake(self.view.bounds.size.width / 3 - 10 , self.view.bounds.size.width / 3 - 10 );
    collectionViewLayout.minimumLineSpacing = 5;
    collectionViewLayout.minimumInteritemSpacing = 5;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:collectionViewLayout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.backgroundColor = [UIColor rsschoolWhiteColor];
    [self.view addSubview:self.collectionView];
 self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
       [NSLayoutConstraint activateConstraints:@[
           [self.collectionView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
           [self.collectionView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
           [self.collectionView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
           [self.collectionView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
       ]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.parentViewController.navigationItem.title = @"Gallery";
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.assetsFetchResult count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell *cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    PHAsset *asset = self.assetsFetchResult[indexPath.item];
    [self.imageManager requestImageForAsset:asset targetSize:cell.imageView.frame.size contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage *result, NSDictionary *info)
             {
        cell.imageView.image = result;
             }];
    
    return cell;
}

@end
