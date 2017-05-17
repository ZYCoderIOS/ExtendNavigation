//
//  _QFNavigationItem.h
//  导航栏
//
//  Created by zhiyiqian on 2017/5/11.
//  Copyright © 2017年 QIngFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface _QFNavigationItem : UINavigationItem
/**
 属于哪个控制器
 */
@property (nonatomic,weak) UIViewController * viewController;
@end
