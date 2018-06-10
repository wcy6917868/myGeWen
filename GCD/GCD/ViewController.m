//
//  ViewController.m
//  GCD
//
//  Created by 王澄宇 on 2018/4/9.
//  Copyright © 2018年 Youwen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testGroup];
    
}

- (void)syncSerial{
    
    NSLog(@"\n\n*************串行同步***************\n\n");
    
    //串行队列
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
    
    //同步执行
    dispatch_sync(queue, ^{
       
        for (int i = 0; i < 3; i ++) {
            
            NSLog(@"串行同步1   %@",[NSThread currentThread]);
            
        }
    });
    
    dispatch_sync(queue, ^{
        
        for (int i = 0; i < 3; i ++) {
            
            NSLog(@"串行同步2   %@",[NSThread currentThread]);
            
        }
        
    });
    
    dispatch_sync(queue, ^{
        
        for (int i = 0; i < 3; i ++) {
            
            NSLog(@"串行同步3   %@",[NSThread currentThread]);
            
        }
        
    });
    
    
}

- (void)asyncSerial{
    
    NSLog(@"\n\n************串行异步************\n\n");
    
    //串行队列
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
    
    //同步执行
    dispatch_async(queue, ^{
    
        for (int i = 0; i < 3; i ++) {
            
            NSLog(@"串行异步1   %@",[NSThread currentThread]);
            
        }
        
        
    });
    
    dispatch_async(queue, ^{
        
        for (int i = 0; i < 3; i ++) {
            
            NSLog(@"串行异步2   %@",[NSThread currentThread]);
            
        }
        
    });
    
    
    dispatch_async(queue, ^{
       
        for (int i = 0; i < 3; i ++) {
            
            NSLog(@"串行异步3    %@",[NSThread currentThread]);
            
        }
        
    });
    
}

- (void)syncConcurrent{
    
    NSLog(@"\n\n***********并发同步************\n\n");
    
    //并发队列
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(queue, ^{
       
        for (int i = 0; i < 3; i ++) {
            
            NSLog(@"并发同步1   %@",[NSThread currentThread]);
            
        }
        
    });
    
    dispatch_sync(queue, ^{
       
        for (int i = 0; i < 3; i ++) {
            
            NSLog(@"并发同步2   %@",[NSThread currentThread]);
            
        }
        
    });
    
    dispatch_sync(queue, ^{
        
        for (int i = 0; i < 3; i ++) {
            
            NSLog(@"并发同步3   %@",[NSThread currentThread]);
            
        }
        
    });
    
    
}

- (void)asyncConcurrent{
    
    NSLog(@"\n\n**********并发异步*************\n\n");
    //并发队列
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    
    //同步执行
    dispatch_async(queue, ^{
       
        for (int i = 0; i < 3; i ++) {
            
            NSLog(@"并发异步1   %@",[NSThread currentThread]);
            
        }
        
    });
    
    //同步执行
    dispatch_async(queue, ^{
        
        for (int i = 0; i < 3; i ++) {
            
            NSLog(@"并发异步2   %@",[NSThread currentThread]);
            
        }
        
    });
    
    //同步执行
    dispatch_async(queue, ^{
        
        for (int i = 0; i < 3; i ++) {
            
            NSLog(@"并发异步3   %@",[NSThread currentThread]);
            
        }
        
    });
    
    
}

- (void)asyncMain{
    
    NSLog(@"\n\n*************主队列异步*************\n\n");
    
    //主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
        
        for (int i = 0; i < 3; i ++) {
            
            NSLog(@"主队列异步1   %@",[NSThread currentThread]);
            
        }
        
    });
    
    dispatch_async(queue, ^{
        
        for (int i = 0; i < 3; i ++) {
            
            NSLog(@"主队列异步2   %@",[NSThread currentThread]);
            
        }
        
    });
    
    dispatch_async(queue, ^{
        
        for (int i = 0; i < 3; i ++) {
            
            NSLog(@"主队列异步3   %@",[NSThread currentThread]);
            
        }
        
    });
    
}

- (void)barrierGCD{
    
    dispatch_queue_t queue = dispatch_queue_create("test",DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
       
        for (int i = 0; i < 3; i ++) {
            
            NSLog(@"栅栏:并发异步1    %@",[NSThread currentThread]);
            
        }
        
    });
    
    dispatch_async(queue, ^{
        
        for (int i = 0; i < 3; i ++) {
            
            NSLog(@"栅栏:并发异步2    %@",[NSThread currentThread]);
            
        }
        
    });
    
    dispatch_barrier_async(queue, ^{
        
        NSLog(@"-----------barrier-------%@",[NSThread currentThread]);
        NSLog(@"*********并发异步执行,但是34一定在12后面*********");
        
    });
    
    dispatch_async(queue, ^{
       
        for (int i = 0; i < 3; i ++) {
            
            NSLog(@"栅栏:并发异步3    %@",[NSThread currentThread]);
            
            
        }
        
    });
    
    dispatch_async(queue, ^{
        
        for (int i = 0; i < 3; i ++) {
            
            NSLog(@"栅栏:并发异步4    %@",[NSThread currentThread]);
            
            
        }
        
    });
    
}

- (void)testGroup{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle]infoDictionary];
    
    NSString *app_version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    NSLog(@"%@",app_version);
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        
        NSLog(@"队列组: 有个耗时操作完成!");
        
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
       
        NSLog(@"队列组:有个耗时操作完成");
        
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
    
        NSLog(@"队列组:前面的耗时操作都完成了,回到主线程进行相关操作");
        
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
