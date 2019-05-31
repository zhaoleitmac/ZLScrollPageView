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


- (instancetype _Nonnull)initWithDelegate:(nullable __kindof UIViewController <ZLScollPageViewDelegate> *)delegate;

+ (instancetype _Nonnull)createWithDelegate:(nullable __kindof UIViewController <ZLScollPageViewDelegate> *)delegate;

- (instancetype _Nonnull)init NS_UNAVAILABLE;

- (instancetype _Nonnull)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

///delegate
@property (nonatomic, weak, readonly) __kindof UIViewController <ZLScollPageViewDelegate> * _Nullable delegate;

///data
@property (nonatomic, strong) NSArray <ZLScollPageModel *> * _Nonnull models;

///hide title when single subViewController
@property (nonatomic, assign) BOOL hideTitleWhenSingle;

///top view for show title
@property (nonatomic, weak, readonly) ZLScollPageTitleView * _Nullable titleView;

///CurrentPageIndex
@property (nonatomic, assign, readonly) NSInteger currentPage;

@end

@protocol ZLScollPageViewDelegate

@optional

- (void)pageDidChanged:(NSInteger)page;

@end
