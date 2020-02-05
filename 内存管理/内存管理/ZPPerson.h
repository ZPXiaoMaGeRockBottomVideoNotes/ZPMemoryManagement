//
//  ZPPerson.h
//  内存管理
//
//  Created by 赵鹏 on 2019/8/16.
//  Copyright © 2019 赵鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZPDog.h"
#import "ZPCar.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZPPerson : NSObject
{
    ZPDog *_dog;
    ZPCar *_car;
    int _age;  //基本数据类型不是OC对象，所以不涉及引用计数的问题
}

//这句代码的意义在于，系统会在.h文件中生成这个属性的set和get方法的声明，并且生成一个带有下划线开头的成员变量。
//@property (nonatomic, assign) int age;

- (void)setAge:(int)age;
- (int)age;

- (void)setDog:(ZPDog *)dog;
- (ZPDog *)dog;

- (void)setCar:(ZPCar *)car;
- (ZPCar *)car;

@end

NS_ASSUME_NONNULL_END
