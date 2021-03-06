//
//  GalleryViewController.h
//  YLTask6
//
//  Created by Юлия Лопатина on 6/22/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@import Photos;
@interface GalleryViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UIImageView *fullImageView;

@end

NS_ASSUME_NONNULL_END
