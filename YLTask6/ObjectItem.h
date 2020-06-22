//
//  ObjectItem.h
//  YLTask6
//
//  Created by Юлия Лопатина on 6/22/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ObjectItem : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *subscription;
@property (nonatomic, assign) BOOL completed;

- (instancetype)initWithTitle:(NSString *)title;// image:(NSString *)imageName subscription:(NSString *)subscription;
@end

NS_ASSUME_NONNULL_END
