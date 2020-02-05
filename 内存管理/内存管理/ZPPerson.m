//
//  ZPPerson.m
//  内存管理
//
//  Created by 赵鹏 on 2019/8/16.
//  Copyright © 2019 赵鹏. All rights reserved.
//

#import "ZPPerson.h"

@implementation ZPPerson

/**
 左边是属性名，右边是成员变量，这句代码的意义在于生成的成员变量就是"_age"，并且系统会生成set和get方法的实现；
 随着编译器的发展，下面的这句代码也不用写了，只在.h文件中撰写"@property+属性名"就可以了。它代表在.h文件中生成一个带有下划线开头的成员变量，并且生成这个属性的set和get方法的声明，而且在.m文件中生成这个属性的set和get方法的实现。
 */
//@synthesize age = _age;

/**
 在.h文件中在"@property"关键字后面的小括号内对OC对象进行修饰的时候一般写"retain"关键字，因为这样的话系统就会自动生成这种写法的set方法。
 */
- (void)setDog:(ZPDog *)dog
{
    if (_dog != dog)  //新传过来的对象如果和原来的对象不相同的话再进行下边的代码，这样能防止“僵尸对象”的出现。
    {
        //先把原来的_dog进行释放
        [_dog release];
        
        //将传递过来的dog对象的引用计数加1，然后再把这个对象的内存地址赋给成员变量_dog，这样的话就让person对象拥有了这个dog对象。
        _dog = [dog retain];
    }
}

- (ZPDog *)dog
{
    return _dog;
}

- (void)setCar:(ZPCar *)car
{
    if (_car != car)
    {
        [_car release];
        _car = [car retain];
    }
}

- (ZPCar *)car
{
    return _car;
}

-(void)setAge:(int)age
{
    _age = age;
}

- (int)age
{
    return _age;
}

/**
 在MRC环境下，即便在.h文件中写了"@property"关键字了，也只是生成了成员变量以及set和get方法的声明和实现，但是在本方法内还是需要手动释放的。
 */
- (void)dealloc
{
    /**
     已经在本类的"setDog:"方法中对dog对象的引用计数加1了，此时person对象已经拥有了这个dog对象了，所以在这个person对象被销毁的时候，它所拥有的dog对象也应该被一并销毁掉。所以对dog对象调用release方法并把指针置为nil；
     一般撰写的规范是子类的东西先释放，然后再释放父类的东西，所以这部分代码写在前面。
     */
    [_dog release];
    _dog = nil;
    
    [_car release];
    _car = nil;
    
    NSLog(@"%s", __func__);
    
    [super dealloc];
}

@end
