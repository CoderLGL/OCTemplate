//
//  ViewController.m
//  OCTemplate
//
//  Created by LGL on 2022/12/15.
//

#import "ViewController.h"
#import "UILabel+EX.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

// 重写该方法监听模式的改变
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    
    NSLog(@"traitCollectionDidChange");
    // 创建动态 color
    UIColor *color = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
        if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            return [UIColor darkGrayColor];
        }
        else {
            return [UIColor redColor];
        }

    }];
    self.view.backgroundColor = color;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[ThemeManager shareInstance] themeChanged];
}
@end
