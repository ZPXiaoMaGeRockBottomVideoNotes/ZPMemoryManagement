//
//  ZPDog.m
//  内存管理
//
//  Created by 赵鹏 on 2019/8/16.
//  Copyright © 2019 赵鹏. All rights reserved.
//

#import "ZPDog.h"

@implementation ZPDog

- (void)run
{
    NSLog(@"%s", __func__);
}

- (void)dealloc
{
    [super dealloc];
    
    NSLog(@"%s", __func__);
}

@end
