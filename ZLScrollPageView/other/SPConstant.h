//
//  SPConstant.h
//  ZLScrollPageView
//
//  Created by 赵雷 on 2018/7/30.
//  Copyright © 2018年 赵雷. All rights reserved.
//

#import <UIKit/UIKit.h>

///device size
#define SP_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SP_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SP_SCREEN_SIZE ([UIScreen mainScreen].bounds.size)
#define SP_STATUS_BAR_HEIGHT ([UIApplication sharedApplication].statusBarFrame.size.height)

///weak/strong reference
#define SPSelfWeakly __weak typeof(self) __SPWeakSelf = self;
#define SPSelfStrongly __strong typeof(__SPWeakSelf) self = __SPWeakSelf;
