//
//  GLViewController.m
//  SSZ
//
//  Created by edz on 2020/3/24.
//  Copyright © 2020 LGL. All rights reserved.
//

#import "GLViewController.h"

@interface GLViewController ()

@end

@implementation GLViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    // 显示导航栏
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//    // 导航栏白色
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage gl_createImageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:[UIImage gl_createImageWithColor:kWhiteColor]];
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:kBlackColor,NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:18]}];
    
    
}

//设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    // 在 viewWillAppear 里设置  在 viewWillDisappear 还原
    if (@available(iOS 13.0, *)) {
        UIView *statusBar = [[UIView alloc]initWithFrame:[UIApplication sharedApplication].keyWindow.windowScene.statusBarManager.statusBarFrame] ;
        statusBar.backgroundColor = [UIColor whiteColor];
        [[UIApplication sharedApplication].keyWindow addSubview:statusBar];
    } else {
        // Fallback on earlier versions
        UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
        if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
            statusBar.backgroundColor = [UIColor whiteColor];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    

}



@end
