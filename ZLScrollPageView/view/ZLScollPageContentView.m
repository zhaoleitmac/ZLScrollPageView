//
//  ZLScollPageContentView.m
//  ZLScollPageVC
//
//  Created by 赵雷 on 2017/10/30.
//  Copyright © 2017年 com.zlfw.ZLScollPageVC All rights reserved.
//

#import "ZLScollPageContentView.h"
#import "SPConstant.h"

@interface ZLScollPageContentView () <UIScrollViewDelegate>

@property (nonatomic, assign) NSInteger currentPage;

@end

@implementation ZLScollPageContentView

- (void)setPageViews:(NSArray<UIView *> *)pageViews {
    for (UIView *view in _pageViews) {
        [view removeFromSuperview];
    }
    _pageViews = pageViews;
    for (UIView *view in pageViews) {
        view.autoresizingMask = UIViewAutoresizingNone;
        [self addSubview:view];
    }
    self.contentSize = CGSizeMake(pageViews.count * SP_SCREEN_WIDTH, 0);
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
    
}

- (void)setupView {
    self.delegate = self;
    self.pagingEnabled = YES;
    self.bounces = NO;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
}

- (void)scollToPage:(NSInteger)page {
    if (self.currentPage != page && page > 0 && page <= self.pageViews.count) {
        [UIView animateWithDuration:0.3 animations:^{
            self.contentOffset = CGPointMake((page - 1) * SP_SCREEN_WIDTH, 0);
        }];
    }
}

- (void)layoutSubviews {
    for (int i = 0; i < self.pageViews.count; i++) {
        UIView *view = self.pageViews[i];
        CGRect frame = CGRectMake(i * SP_SCREEN_WIDTH, 0, SP_SCREEN_WIDTH, self.frame.size.height);
        view.frame = frame;
    }
    [super layoutSubviews];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint contentOffset = scrollView.contentOffset;
    int page = contentOffset.x / SP_SCREEN_WIDTH + 0.5 + 1;
    self.currentPage = page;
    if (self.pagingAction) {
        self.pagingAction(page);
    }
}

@end
