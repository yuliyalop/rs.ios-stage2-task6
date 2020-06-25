//
//  Data.h
//  YLTask6
//
//  Created by Юлия Лопатина on 6/24/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
NS_ASSUME_NONNULL_BEGIN

@interface Data : NSObject
@property (strong, nonatomic) UIImageView *image;
@property (strong, nonatomic) UIImage *icon;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *subtitle;
-(instancetype)initWithImage: (UIImageView *)image title: (NSString *)title subtitle: (NSString *)subtitle;// icon: (UIImage *)icon;
@end

NS_ASSUME_NONNULL_END
