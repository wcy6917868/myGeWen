//
//  ViewController.m
//  danlilianxi
//
//  Created by 王澄宇 on 16/10/1.
//  Copyright © 2016年 Henry. All rights reserved.
//

#import "ViewController.h"
#import "danli.h"
#import "anyViewController.h"
#import "justone.h"
#import "NetManager.h"
#import <MBProgressHUD.h>
#define postImageAPI @"http://139.196.179.91/carmanl/public/account/common/upload"

@interface ViewController ()<MBProgressHUDDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(50, 50, 150, 80);
    label.backgroundColor = [UIColor redColor];
    label.text = @"黄老狗,你会死";
    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"black beatles 哈哈哈哈哈哈哈哈哈";
    
    [label sizeToFit];
    [self.view addSubview:label];
}


- (void)gg:(UIButton *)selectBtn
{

    anyViewController *anyVC = [[anyViewController alloc]init];
    anyVC.anyStr = @"1111";
    [self presentViewController:anyVC animated:YES completion:nil];
    
}

- (void)ss:(UIButton *)ssBtn
{
    NSLog(@"55555");
    ssBtn.backgroundColor = [UIColor redColor];
    UIButton *btn = [self.view viewWithTag:100];
    [btn addTarget:self action:@selector(gg:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
