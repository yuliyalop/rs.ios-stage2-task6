//
//  Data.m
//  YLTask6
//
//  Created by Юлия Лопатина on 6/24/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import "Data.h"

@implementation Data
-(instancetype)initWithImage: (UIImageView *)image title: (NSString *)title subtitle: (NSString *)subtitle; //icon: (UIImage *)icon; {
{
    self = [super init];
    if (self) {
        _image = image;
        _title = title;
        _subtitle = subtitle;
        //_icon = icon;
    }
    return self;
}
@end
