# ZPMemoryManagement
本Demo主要介绍了引用计数的概念，还介绍了在MRC环境下调用"retain"和"release"方法对对象引用计数的影响，还介绍了在MRC环境下调用"alloc"、"new"、"copy"、"mutableCopy"等方法的时候应该调用"release"或者"autorelease"方法来手动释放内存，还介绍了内存泄漏的原因，还介绍了在MRC环境下"autorelease"方法的作用，还介绍了在MRC环境下"@autoreleasepool"关键字的作用，还剖析了在MRC环境下对可变和不可变字符串调用"copy"和"mutableCopy"方法之后这个对象引用计数的变化，还介绍了在MRC环境下成员变量的"set"和"get"方法是如何撰写的，还介绍了"@property"和"@synthesize"关键字的作用。

视频路径：小马哥——>2018年9月iOS底层原理班（加密版）——>下（OC对象、关联对象、多线程、内存管理、性能优化）——>2.底层下-原理——>day25——>206-内存管理14-MRC01.ev4、207-内存管理15-MRC02.ev4、208-内存管理16-MRC03.ev4、209-内存管理17.ev4。
