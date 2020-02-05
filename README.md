# ZPMemoryManagement
本Demo主要介绍了引用计数的概念，还介绍了在MRC环境下调用"retain"和"release"方法对对象引用计数的影响，还介绍了在MRC环境下调用"alloc"、"new"、"copy"、"mutableCopy"等方法的时候应该调用"release"或者"autorelease"方法来手动释放内存，还介绍了内存泄漏的原因，还介绍了在MRC环境下"autorelease"方法的作用，还介绍了在MRC环境下"@autoreleasepool"关键字的作用，还剖析了在MRC环境下对可变和不可变字符串调用"copy"和"mutableCopy"方法之后这个对象引用计数的变化，还介绍了在MRC环境下成员变量的"set"和"get"方法是如何撰写的，还介绍了"@property"和"@synthesize"关键字的作用。
