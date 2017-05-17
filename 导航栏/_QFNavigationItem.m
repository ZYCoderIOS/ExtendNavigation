//
//  _QFNavigationItem.m
//  导航栏
//
//  Created by zhiyiqian on 2017/5/11.
//  Copyright © 2017年 QIngFeng. All rights reserved.
//

#import "_QFNavigationItem.h"

@implementation _QFNavigationItem
- (void)setViewController:(UIViewController *)viewController
{
    _viewController = viewController;
    if (self.viewController.navigationController.viewControllers.count>1)
    {
        UIImage *backButtonImage = [UIImage imageNamed:@"icon_nav_back"];
        UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(backTapped:)];
        self.leftBarButtonItem = backBarButtonItem;
    }
}

- (void)backTapped:(id)sender {
    [self.viewController.navigationController popViewControllerAnimated:YES];
}
@end
