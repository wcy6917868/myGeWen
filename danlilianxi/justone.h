//
//  justone.h
//  danlilianxi
//
//  Created by 王澄宇 on 16/10/1.
//  Copyright © 2016年 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface justone : NSObject

@property (nonatomic,copy)NSString *str111;

+(instancetype)allocWithZone:(struct _NSZone *)zone;


+(instancetype)shareInstance;
@end
