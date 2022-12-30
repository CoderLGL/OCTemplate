//
//  ThemeManager.m
//  OCTemplate
//
//  Created by LGL on 2022/12/16.
//

#import "ThemeManager.h"

// 创建静态对象 防止外部访问
static ThemeManager *_instance = nil;

@implementation ThemeManager

#pragma mark ==========创建单例==========
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    //    @synchronized (self) {
    //        // 为了防止多线程同时访问对象，造成多次分配内存空间，所以要加上线程锁
    //        if (_instance == nil) {
    //            _instance = [super allocWithZone:zone];
    //        }
    //        return _instance;
    //    }
    // 也可以使用一次性代码
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
            _instance.themeTable = [NSHashTable hashTableWithOptions:NSHashTableWeakMemory];
        }
    });
    return _instance;
}

// 为了使实例易于外界访问 我们一般提供一个类方法
// 类方法命名规范 share类名|default类名|类名
+(instancetype)shareInstance{
    //return _instance;
    // 最好用self 用AppManager他的子类调用时会出现错误
    return [[self alloc] init];
}
// 为了严谨，也要重写copyWithZone 和 mutableCopyWithZone
-(id)copyWithZone:(NSZone *)zone{
    return _instance;
}
-(id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}



- (void)themeChanged{
    
    for (id item in self.themeTable) {
        if ([item isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)item;
            [label themeChanged];
        }
    }
    
}




@end
