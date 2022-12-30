//
//  UtilsMacros.h
//  OCTemplate
//
//  Created by LGL on 2022/12/16.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h


//获取系统对象
#define kApplication                [UIApplication sharedApplication]
#define kAppWindow               [UIApplication sharedApplication].delegate.window
#define kAppDelegate              [AppDelegate shareAppDelegate]
#define kRootViewController     [UIApplication sharedApplication].delegate.window.rootViewController


// 常用UI高度
#define kStatusBarHeight       [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight           44.0
#define kTopHeight               (kStatusBarHeight + kNavBarHeight)
#define kTabBarHeight          ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define kBottomSafeHeight   (kTabBarHeight - 49)


// 屏幕宽高
#define kScreenWidth        [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight       [[UIScreen mainScreen] bounds].size.height
#define kScreenBounds      [UIScreen mainScreen].bounds


//根据iphone6的屏幕来拉伸
#define kRealValue(with) ((with)*([[UIScreen mainScreen] bounds].size.width/375.0f))
#define kAspectRatio(height) ([[UIScreen mainScreen] bounds].size.width)/(375.0f/(height))

#define kScreenScale(value) ((value)*([[UIScreen mainScreen] bounds].size.width/375.0f))

#define kScaleWidth(with) ((with)*([[UIScreen mainScreen] bounds].size.width/375.0f))
#define kScaleHeight(height) ((height)*([[UIScreen mainScreen] bounds].size.height/667.0f))




// 全局颜色
#define kWhiteColor     [UIColor gl_colorWithHexString:@"#ffffff"]
#define kBlackColor     [UIColor gl_colorWithHexString:@"#333333"]
#define kRedColor     [UIColor gl_colorWithHexString:@"#ff091e"]
#define kGaryColor     [UIColor gl_colorWithHexString:@"#999999"]
#define kBackgroundColor     [UIColor gl_colorWithHexString:@"#f5f5f5"]
#define kYellowColor     [UIColor gl_colorWithHexString:@"#ffe200"]


// 个人信息
#define userTokenData @"userTokenData"
#define aesKey @""

// NSLog打印
#ifdef __OBJC__

#ifdef DEBUG
#define NSLog(format, ...) printf("[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define NSLog(format, ...)
#endif


#endif


//强弱引用
/**
Synthsize a weak or strong reference.

Example:
   @weakify(self)
   [self doSomething^{
       @strongify(self)
       if (!self) return;
       ...
   }];
*/
#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif


#endif /* UtilsMacros_h */
