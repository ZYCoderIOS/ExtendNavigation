//
//  QFNavigationBar.m
//  导航栏
//
//  Created by zhiyiqian on 2017/5/2.
//  Copyright © 2017年 QIngFeng. All rights reserved.
//

#import "_QFNavigationBar.h"

// 缺省情况下导航栏的颜色
#define kDefaultNavigationBar [UIColor whiteColor]

@implementation _QFNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.barTintColor = kDefaultNavigationBar;
    }
    return self;
}
@end
