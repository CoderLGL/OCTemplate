//
//  GLBaseCollectionView.m
//  OCTemplate
//
//  Created by LGL on 2022/12/15.
//

#import "GLBaseCollectionView.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

@interface GLBaseCollectionView ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *title;

@end

@implementation GLBaseCollectionView

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


- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView {
    return 25.0f;
}


@end
