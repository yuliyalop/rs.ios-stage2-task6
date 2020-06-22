//
//  UIColor+RSColors.h
//  YLTask6
//
//  Created by Юлия Лопатина on 6/21/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (RSColors)

+(UIColor *)rsschoolBlackColor;
+(UIColor *)rsschoolWhiteColor;
+(UIColor *)rsschoolRedColor;
+(UIColor *)rsschoolBlueColor;
+(UIColor *)rsschoolGreenColor;
+(UIColor *)rsschoolYellowColor;
+(UIColor *)rsschoolGrayColor;
+(UIColor *)rsschoolYellowHighlightedColor;

+ (UIColor *)colorWithHexString:(NSString *) hexString;
@end

NS_ASSUME_NONNULL_END
