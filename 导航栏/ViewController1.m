//
//  ViewController1.m
//  导航栏
//
//  Created by zhiyiqian on 2017/5/11.
//  Copyright © 2017年 QIngFeng. All rights reserved.
//

#import "ViewController1.h"
#import "ViewController2.h"
#import "UIViewController+ExtendNavigation.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"控制器1";

    self.view.backgroundColor = [UIColor cyanColor];
    
    self.navigationBar.barTintColor = [UIColor redColor];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    ViewController2 * vc = [[ViewController2 alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
