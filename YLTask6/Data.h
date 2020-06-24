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
@property (strong, nonatomic) UIImage *image;
-(instancetype)initWithImageNumber;

@end

NS_ASSUME_NONNULL_END
