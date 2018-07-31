//
//  ZLScollPageContentView.h
//  ZLScollPageVC
//
//  Created by 赵雷 on 2017/10/30.
//  Copyright © 2017年 com.zlfw.ZLScollPageVC All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLScollPageContentView : UIScrollView

@property (nonatomic, strong) NSArray <UIView *> *pageViews;

@property (nonatomic, copy) void (^pagingAction)(NSInteger tag);

- (void)scollToPage:(NSInteger)page;

@end
