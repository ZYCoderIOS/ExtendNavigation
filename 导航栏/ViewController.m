//
//  ViewController.m
//  导航栏
//
//  Created by zhiyiqian on 2017/5/2.
//  Copyright © 2017年 QIngFeng. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "_QFNavigationItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.navigationItem.title = @"ViewController";


    
    UIView * searchBarBGView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 44)];
    UISearchBar * searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    [searchBarBGView addSubview:searchBar];
    searchBar.placeholder = @"输入商品关键词";
    self.navigationItem.titleView = searchBar;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    ViewController1 * vc = [[ViewController1 alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
