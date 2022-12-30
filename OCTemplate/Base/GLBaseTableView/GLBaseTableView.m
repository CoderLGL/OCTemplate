//
//  GLBaseTableView.m
//  SSZ
//
//  Created by edz on 2020/4/2.
//  Copyright © 2020 LGL. All rights reserved.
//

#import "GLBaseTableView.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>


@interface GLBaseTableView ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *title;
@end

@implementation GLBaseTableView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
    
    }
    return self;
}

- (void)setupEmptyViewWithImageName:(NSString *)imageName title:(NSString *)title{
    self.emptyDataSetDelegate = self;
    self.emptyDataSetSource = self;
    self.imageName = imageName;
    self.title = title;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *imageName;
    if (self.imageName.length > 0) {
        imageName = self.imageName;
    }
    else{
        imageName = @"empty_data";
    }
    
    return [UIImage imageNamed:imageName];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text;
    if (self.title.length > 0) {
        text = self.title;
    }
    else{
        text = @"暂无数据";
    }
    
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0f],
                                 NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

// 设置界面元素的垂直间距
- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView {
    return 0;
}
/**
* 设置界面的垂直和水平方向的对齐约束， 默认为CGPointZero
*/
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView{
    return 0;
}

@end
