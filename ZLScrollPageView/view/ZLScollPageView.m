//
//  ZLScollPageView.m
//  ZLScollPageView
//
//  Created by 赵雷 on 2017/10/30.
//  Copyright © 2017年 com.zlfw.ZLScollPageVC All rights reserved.
//

#import "ZLScollPageView.h"
#import "ZLScollPageModel.h"
#import "ZLScollPageContentView.h"
#import "SPConstant.h"
#import "SPLog.h"

@interface ZLScollPageView()

@property (nonatomic, weak) ZLScollPageContentView *contentView;

@end

@implementation ZLScollPageView

- (void)setContentView:(ZLScollPageContentView *)contentView {
    _contentView = contentView;
}

- (void)setModels:(NSArray<ZLScollPageModel *> *)models {
    if (_models.count) {
        NSMutableArray *vcsM = [NSMutableArray arrayWithCapacity:_models.count];
        for (ZLScollPageModel *model in _models) {
            [vcsM addObject:model.viewController];
        }
        NSArray *vcs = vcsM.copy;
        NSArray <__kindof UIViewController *> *childViewControllers = self.delegate.childViewControllers;
        for (__kindof UIViewController *viewController in childViewControllers) {
            if ([vcs containsObject:viewController]) {
                [viewController removeFromParentViewController];
                [viewController.view removeFromSuperview];
            }
        }
    }
    
    _models = models;
    if (self.titleView && self.contentView) {
        [self showData];
    }
}

- (instancetype)initWithDelegate:(nullable __kindof UIViewController <ZLScollPageViewDelegate> *)delegate {
    if (self = [super init]) {
        _delegate = delegate;
        [self setupCoreView];
    }
    return self;
}

+ (instancetype)createWithDelegate:(nullable __kindof UIViewController <ZLScollPageViewDelegate> *)delegate {
    return [[ZLScollPageView alloc] initWithDelegate:delegate];
}

- (void)setupCoreView {
    ZLScollPageTitleView *titleView = [ZLScollPageTitleView new];
    titleView.hidden = YES;
    [self addSubview:titleView];
    _titleView = titleView;
    
    ZLScollPageContentView *contentView = [ZLScollPageContentView new];
    contentView.hidden = YES;
    [self addSubview:contentView];
    self.contentView = contentView;
    
    SPSelfWeakly
    titleView.btnAction = ^(NSInteger tag) {
        SPSelfStrongly
        [self.contentView scollToPage:tag];
        self->_currentPage = tag;
        if ([self.delegate respondsToSelector:@selector(pageDidChanged:)]) {
            [self.delegate pageDidChanged:tag];
        }
    };
    
    contentView.pagingAction = ^(NSInteger tag) {
        SPSelfStrongly
        [self.titleView selectedButtonChanged:tag];
    };
}

- (void)showData {
    if (self.models.count > 0) {
        self.titleView.hidden = NO;
        self.contentView.hidden = NO;
        NSMutableArray *titles = [NSMutableArray arrayWithCapacity:self.models.count];
        NSMutableArray *views = [NSMutableArray arrayWithCapacity:self.models.count];
        
        for (ZLScollPageModel *model in self.models) {
            [titles addObject:model.title];
            [views addObject:model.viewController.view];
            [self.delegate addChildViewController:model.viewController];
        }
        self.contentView.pageViews = views.copy;
        self.titleView.titles = titles.copy;
        _currentPage = 1;
    } else {
        self.titleView.hidden = YES;
        self.contentView.hidden = YES;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat titleHeight = self.titleView.height;
    if (_hideTitleWhenSingle && self.models.count == 1) {
        titleHeight = 0;
    }
    self.titleView.frame = CGRectMake(0, 0, SP_SCREEN_WIDTH, titleHeight);
    self.contentView.frame = CGRectMake(0, titleHeight, SP_SCREEN_WIDTH, self.frame.size.height - titleHeight);
}

- (void)dealloc {
    SP_MEMORAY_CHECK_DEBUG_LOG;
}

@end
