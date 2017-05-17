//
//  BaseViewController.m
//  导航栏
//
//  Created by zhiyiqian on 2017/5/2.
//  Copyright © 2017年 QIngFeng. All rights reserved.
//

#import "BaseViewController.h"

static CGFloat UINavigationBarH = 64;

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationBar * diyNavigationBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, UINavigationBarH)];
    [self.view addSubview:diyNavigationBar];
}
@end

