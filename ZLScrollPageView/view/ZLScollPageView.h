//
//  ZLScollPageView.h
//  ZLScollPageView
//
//  Created by 赵雷 on 2017/10/30.
//  Copyright © 2017年 com.zlfw.ZLScollPageVC All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLScollPageTitleView.h"

@class ZLScollPageModel;
@class ZLScollPageContentView;

@protocol ZLScollPageViewDelegate;

@interface ZLScollPageView : UIView


- (instancetype)initWithDelegate:(nullable __kindof UIViewController <ZLScollPageViewDelegate> *)delegate;

+ (instancetype)createWithDelegate:(nullable __kindof UIViewController <ZLScollPageViewDelegate> *)delegate;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

///delegate
@property (nonatomic, weak, readonly) __kindof UIViewController <ZLScollPageViewDelegate> *delegate;

///data
@property (nonatomic, strong) NSArray <ZLScollPageModel *> *models;

//@property (nonatomic, assign) BOOL showTitleWhenSingle;

///top view for show title
@property (nonatomic, weak, readonly) ZLScollPageTitleView *titleView;

///CurrentPageIndex
@property (nonatomic, assign, readonly) NSInteger currentPage;

@end

@protocol ZLScollPageViewDelegate

@optional

- (void)pageDidChanged:(NSInteger)page;

@end
