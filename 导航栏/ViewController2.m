//
//  ViewController2.m
//  导航栏
//
//  Created by zhiyiqian on 2017/5/11.
//  Copyright © 2017年 QIngFeng. All rights reserved.
//

#import "ViewController2.h"
#import "UIViewController+ExtendNavigation.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"控制器2";

    
    self.view.backgroundColor = [UIColor greenColor];

    self.navigationBar.barTintColor = [UIColor cyanColor];
    
    
}


@end
