//
//  ZLScollPageModel.h
//  ZLScollPageVC
//
//  Created by 赵雷 on 2017/10/30.
//  Copyright © 2017年 com.zlfw.ZLScollPageVC All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLScollPageModel : NSObject

@property (nonatomic, strong) __kindof UIViewController *viewController;

@property (nonatomic, copy) NSString *title;

+ (instancetype)pageModelWithVC:(__kindof UIViewController *)viewController title:(NSString *)title;

@end
