//
//  anyViewController.m
//  danlilianxi
//
//  Created by 王澄宇 on 16/10/1.
//  Copyright © 2016年 Henry. All rights reserved.
//

#import "anyViewController.h"
#import "danli.h"
#import "justone.h"

@interface anyViewController ()

@end

@implementation anyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self lalala];
    
}

- (void)lalala
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:1480925657];
    NSLog(@"%@",date);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    NSLog(@"%@",strDate);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
