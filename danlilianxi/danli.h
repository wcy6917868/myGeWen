//
//  danli.h
//  danlilianxi
//
//  Created by 王澄宇 on 16/10/1.
//  Copyright © 2016年 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface danli : NSObject
@property (nonatomic,copy)NSString *str;
@property (nonatomic,copy)NSString *str1;
@property (nonatomic,copy)NSString *str2;

+ (danli *)sharedInstance;

@end
