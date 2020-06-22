//
//  ObjectItem.m
//  YLTask6
//
//  Created by Юлия Лопатина on 6/22/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import "ObjectItem.h"

@implementation ObjectItem
- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        _title = title;
        _completed = NO;
    }
    return self;
}
@end
