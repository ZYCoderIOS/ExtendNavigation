//
//  UIViewController+ExtendNavigation.h
//  导航栏
//
//  Created by zhiyiqian on 2017/5/12.
//  Copyright © 2017年 QIngFeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "_QFNavigationBar.h"
#import "_QFNavigationItem.h"

@interface UIViewController (ExtendNavigation)
/**
 导航栏,只可以定制导航栏的属性
 */
@property (nonatomic,strong,readonly) _QFNavigationBar *navigationBar;

@property (nonatomic,strong,readonly) _QFNavigationItem * navigationItem;

@end
