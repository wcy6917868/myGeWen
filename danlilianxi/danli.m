//
//  danli.m
//  danlilianxi
//
//  Created by 王澄宇 on 16/10/1.
//  Copyright © 2016年 Henry. All rights reserved.
//

#import "danli.h"

@implementation danli

+ (danli *)sharedInstance {
    
    static danli *user = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        user = [[danli alloc] init];
    });
    return user;
}

@end
