//
//  ZLScollPageModel.m
//  ZLScollPageVC
//
//  Created by 赵雷 on 2017/10/30.
//  Copyright © 2017年 com.zlfw.ZLScollPageVC All rights reserved.
//

#import "ZLScollPageModel.h"

@implementation ZLScollPageModel

+ (instancetype)pageModelWithVC:(__kindof UIViewController *)viewController title:(NSString *)title {
    ZLScollPageModel *model = [ZLScollPageModel new];
    model.viewController = viewController;
    model.title = title;
    return model;
}

- (NSString *)title {
    if (!_title) {
        _title = @"";
    }
    return _title;
}

@end
