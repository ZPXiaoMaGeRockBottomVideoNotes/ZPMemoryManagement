//
//  ViewController.m
//  内存管理
//
//  Created by 赵鹏 on 2019/8/16.
//  Copyright © 2019 赵鹏. All rights reserved.
//

/**
 ·为了营造MRC环境，先要在TARGETS中的Build Settings中把ARC由YES改为NO；
 ·在iOS中，使用引用计数来管理OC对象的内存；
 ·一个新创建的OC对象的引用计数默认是1，当它的引用计数减为0的时候，该对象就会被系统销毁掉，释放其占用的内存空间；
 ·调用"retain"方法会让OC对象的引用计数+1，调用"release"方法会让OC对象的引用计数-1；
 ·当调用alloc、new、copy、mutableCopy方法返回了一个对象，在不需要这个对象时，要调用release或者autorelease来释放它；
 ·想拥有某个对象，就让它的引用计数+1；不想再拥有某个对象，就让它的引用计数-1；
 ·内存泄露：因为iOS项目是RunLoop运行循环，如果用完了对象而在代码中不做销毁操作的话，这个对象的内存空间是始终存在的，除非这个项目被手动杀死。如果不杀死的话，这个项目是始终存在的，则这个对象也是始终存在的，所以对象所对应的那片内存空间也是始终存在的，随着程序的运行，像这种的对象会越堆积越多，就会有很多的内存不被释放，这种现象叫做“内存泄露”。
 */
#import "ViewController.h"
#import "ZPPerson.h"
#import "ZPDog.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self test];
    
//    [self test1];
    
//    [self test2];
    
    [self test3];
}

- (void)test
{
    ZPPerson *person = [[ZPPerson alloc] init];
    
    //查看对象的引用计数：此时对象的引用计数为1。
    NSLog(@"%zd", person.retainCount);
    
    //在MRC环境下，调用release方法后，对象的引用计数会减1。当对象的引用计数为0的时候，系统就会自动调用对象的dealloc方法。
    [person release];
}

- (void)test1
{
    @autoreleasepool {
        /**
         在MRC环境下，autorelease方法一般和外面的"@autoreleasepool"关键字还有大括号联合使用；
         autorelease和release方法的区别是release方法是在开发者创建了新对象以后，要开发者确定在新对象不用了之后再进行调用，从而释放新对象的内容空间，而autorelease方法是在开发者一开始创建新对象的时候就进行调用，创建以后就不用随时关心什么时候对象彻底就不用了，系统会在"@autoreleasepool"最后一个大括号结束的时候统一调用release方法来释放新对象的内存空间。
         */
        ZPPerson *person = [[[ZPPerson alloc] init] autorelease];
    }
}

- (void)test2
{
    ZPDog *dog = [[ZPDog alloc] init];  //dog引用计数为1
    
    ZPPerson *person = [[ZPPerson alloc] init];
    [person setDog:dog];  //dog引用计数为2
    
    [dog release];  //dog引用计数为1
    
    [[person dog] run];
    
    [person release];  //dog引用计数为0
}

- (void)test3
{
    @autoreleasepool {
        //下面的这句代码调用的是"stringWithFormat:"类方法来创建的字符串对象，一般这样的类方法会在它的方法实现的内部会自动调用"autorelease"方法。
//        NSString *str = [NSString stringWithFormat:@"test"];
        
        //下面的这句代码使用的是"alloc"方法创建的字符串对象，此时str指针所指向的对象的引用计数为1。
        NSString *str = [[NSString alloc] initWithFormat:@"test1111111111"];
        
        /**
         对不可变字符串str调用"copy"方法，就相当于对str指针指向的那个对象调用了"retain"方法，所以那个对象的引用计数会加1，此时那个对象的引用计数就由1变为了2；
         对不可变字符串调用"copy"方法，是浅拷贝，不会产生新的对象，而是str和str1两块内存空间中存储的都是存储"test1111111111"文本的那块内存空间的地址，即str和str1两个指针指向的都是同一块内存区域。
         */
        NSString *str1 = [str copy];
        
        //因为str和str1两个指针指向的都是同一个对象，所以打印他们两个的引用计数都应该是2。
        NSLog(@"%zd, %zd",str.retainCount, str1.retainCount);
        
        /**
         对不可变字符串str调用"mutableCopy"方法，是深拷贝，会产生一个新的可变字符串对象，并且这个新的可变字符串对象由str2指针指着；
         str2指针所指向的那个对象的引用计数变为1。
         */
        NSMutableString *str2 = [str mutableCopy];
        NSLog(@"%zd", str2.retainCount);
        
        [str release];  //str指针指向的那个对象的引用计数由2变为1
        [str1 release];  //str1指针指向的那个对象的引用计数由1变为0
        [str2 release];  //str2指针指向的那个对象的引用计数由1变为0
    }
}

@end
