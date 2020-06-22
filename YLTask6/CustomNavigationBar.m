//
//  CustomNavigationBar.m
//  YLTask6
//
//  Created by Юлия Лопатина on 6/23/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import "CustomNavigationBar.h"
#import "UIColor+RSColors.h"
@implementation CustomNavigationBar
-(void) setUp {
    CustomNavigationBar *NB = [[CustomNavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
    NB.barTintColor = [UIColor rsschoolYellowColor];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
