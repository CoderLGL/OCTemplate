//
//  ThemeManager.h
//  OCTemplate
//
//  Created by LGL on 2022/12/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ThemeManager : NSObject

+(instancetype)shareInstance;

@property(nonatomic, strong) NSHashTable *themeTable;

- (void)themeChanged;

@end

NS_ASSUME_NONNULL_END
