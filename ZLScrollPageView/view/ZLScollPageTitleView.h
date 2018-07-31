//
//  ZLScollPageTitleView.h
//  ZLScollPageVC
//
//  Created by 赵雷 on 2017/10/30.
//  Copyright © 2017年 com.zlfw.ZLScollPageVC All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPEnums.h"

@class ZLScollPageTitleModel;

@interface ZLScollPageTitleView : UIScrollView

@property (nonatomic, copy) void (^btnAction)(NSInteger tag);

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, strong) NSArray <NSString *> *titles;

@property (nonatomic, assign) ZLScollPageIndicateLineLocal indicateLineLocal;

@property (nonatomic, strong) UIFont *titleFont;

@property (nonatomic, strong) UIColor *btnBgColor;

@property (nonatomic, strong) UIColor *selectedColor;

@property (nonatomic, strong) UIColor *unSelectedColor;

@property (nonatomic, strong) UIColor *selectLineColor;

@property (nonatomic, strong) UIColor *bottomLineColor;

- (void)selectedButtonChanged:(NSInteger)tag;

@end
