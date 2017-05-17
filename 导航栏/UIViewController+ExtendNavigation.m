//
//  UIViewController+ExtendNavigation.m
//  导航栏
//
//  Created by zhiyiqian on 2017/5/12.
//  Copyright © 2017年 QIngFeng. All rights reserved.
//

#import "UIViewController+ExtendNavigation.h"
#import <objc/runtime.h>

@interface UIViewController ()
@property (nonatomic,assign) BOOL loadNavigationBar;
@end

@implementation UIViewController (ExtendNavigation)

+ (void)load
{
    // viewWillAppear方法交换
    {
        IMP imp1 = class_getMethodImplementation([self class], @selector(viewWillAppear:));
        Method m1 = class_getInstanceMethod([self class], @selector(viewWillAppear:));
        Method m2 = class_getInstanceMethod([self class], @selector(viewWillAppear_QF:));
        BOOL result = class_addMethod([self class], @selector(viewWillAppear:), imp1, method_getTypeEncoding(m1));
        if (result != YES)
        {
            method_exchangeImplementations(m1, m2);
        }
    }
    
    // 交换导航栏标题的方法
    {
        IMP imp1 = class_getMethodImplementation([self class], @selector(setTitle:));
        Method m1 = class_getInstanceMethod([self class], @selector(setTitle:));
        Method m2 = class_getInstanceMethod([self class], @selector(setTitle_QF:));
        BOOL result = class_addMethod([self class], @selector(setTitle:), imp1, method_getTypeEncoding(m1));
        if (result != YES)
        {
            method_exchangeImplementations(m1, m2);
        }
    }
}

- (void)viewWillAppear_QF:(BOOL)animated {
    [self viewWillAppear_QF:animated];
    
    if (self.loadNavigationBar)
    {
        NSLog(@"%@",self);
        // 自定义导航栏
        [self styleNavBar];
        self.navigationItem.viewController = self;
        __weak id weakSelf = self;
        self.navigationController.interactivePopGestureRecognizer.delegate = weakSelf;
    }
    self.loadNavigationBar = NO;
}

- (void)setTitle_QF:(NSString *)title
{
    [self setTitle_QF:title];
    self.navigationItem.title = title;
}

- (void)styleNavBar {
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    _QFNavigationBar * newNavBar = self.navigationBar;
    [self.view addSubview:newNavBar];
}


- (void)setNavigationBar:(UINavigationBar *)navigationBar
{
    objc_setAssociatedObject(self, @selector(navigationBar), navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setLoadNavigationBar:(BOOL)loadNavigationBar
{
    objc_setAssociatedObject(self, @selector(loadNavigationBar), @(loadNavigationBar), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)loadNavigationBar
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (_QFNavigationBar *)navigationBar
{
    _QFNavigationBar *navigationBar = objc_getAssociatedObject(self, @selector(navigationBar));
    if (!navigationBar) {
        navigationBar =  [[_QFNavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64.0)];
        [navigationBar setItems:@[self.navigationItem]];
        [self setNavigationBar:navigationBar];
    }
    return navigationBar;
}

- (void)setNavigationItem:(_QFNavigationItem *)navigationItem
{
    objc_setAssociatedObject(self, @selector(navigationItem), navigationItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (_QFNavigationItem *)navigationItem
{
    _QFNavigationItem * item = objc_getAssociatedObject(self, _cmd);
    if (!item){
        item = [[_QFNavigationItem alloc]init];
        [self setNavigationItem:item];
    }
    return item;
}
@end


@interface UINavigationController (ExtendNavigation)
@end
@implementation UINavigationController (ExtendNavigation)
+ (void)load
{
    Method originalMethod = class_getInstanceMethod(self, @selector(pushViewController:animated:));
    Method swizzledMethod = class_getInstanceMethod(self, @selector(qf_pushViewController:animated:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

- (void)qf_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.loadNavigationBar = YES;
    [self qf_pushViewController:viewController animated:animated];
}
@end
