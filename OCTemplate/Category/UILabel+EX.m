//
//  UILabel+EX.m
//  OCTemplate
//
//  Created by LGL on 2022/12/16.
//

#import "UILabel+EX.h"


@implementation UILabel (EX)


- (void)setText:(NSString *)text{
    NSLog(@"sdfsdfsdfsdfs");
}

- (void)setName:(NSString *)name{
    
}

- (void)didMoveToSuperview{
    [[ThemeManager shareInstance].themeTable addObject:self];
}

- (void)themeChanged{
    self.text = @"23456";
}

@end



