//
//  InfoTableViewCell.h
//  YLTask6
//
//  Created by Юлия Лопатина on 6/22/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjectItem.h"
NS_ASSUME_NONNULL_BEGIN

@interface InfoTableViewCell : UITableViewCell

- (void)configureWithObjectItem:(ObjectItem *)objectItem;


@end

NS_ASSUME_NONNULL_END
