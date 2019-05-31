//
//  ViewController.m
//  ZLScrollPageView
//
//  Created by 赵雷 on 2018/7/31.
//  Copyright © 2018年 赵雷. All rights reserved.
//

#import "ViewController.h"
#import "ZLScollPageView.h"
#import "ZLScollPageModel.h"
#import "SPConstant.h"
#import "SPLog.h"

@interface ViewController () <ZLScollPageViewDelegate>

@property (nonatomic, weak) ZLScollPageView *pageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self loadTestData];
}

- (void)setupView {
    ZLScollPageView *pageView = [ZLScollPageView createWithDelegate:self];
//    pageView.hideTitleWhenSingle = YES;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = SP_SCREEN_WIDTH;
    CGFloat height = SP_SCREEN_HEIGHT - SP_STATUS_BAR_HEIGHT - self.navigationController.navigationBar.frame.size.height;
    pageView.frame = CGRectMake(x, y, width, height);
    [self.view addSubview:pageView];
    self.pageView = pageView;
}

- (void)loadTestData {
    ZLScollPageModel *model1 = [ZLScollPageModel new];
    UIViewController *vc1 = [UIViewController new];
    vc1.view.backgroundColor = [UIColor redColor];
    model1.viewController = vc1;
    model1.title = @"红色";
    
    ZLScollPageModel *model2 = [ZLScollPageModel new];
    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor = [UIColor orangeColor];
    model2.viewController = vc2;
    model2.title = @"橙色";
    
    ZLScollPageModel *model3 = [ZLScollPageModel new];
    UIViewController *vc3 = [UIViewController new];
    vc3.view.backgroundColor = [UIColor yellowColor];
    model3.viewController = vc3;
    model3.title = @"黄色";
    
    ZLScollPageModel *model4 = [ZLScollPageModel new];
    UIViewController *vc4 = [UIViewController new];
    vc4.view.backgroundColor = [UIColor greenColor];
    model4.viewController = vc4;
    model4.title = @"绿色";
    
    ZLScollPageModel *model5 = [ZLScollPageModel new];
    UIViewController *vc5 = [UIViewController new];
    vc5.view.backgroundColor = [UIColor cyanColor];
    model5.viewController = vc5;
    model5.title = @"青色";
    
    ZLScollPageModel *model6 = [ZLScollPageModel new];
    UIViewController *vc6 = [UIViewController new];
    vc6.view.backgroundColor = [UIColor blueColor];
    model6.viewController = vc6;
    model6.title = @"蓝色";
    
    ZLScollPageModel *model7 = [ZLScollPageModel new];
    UIViewController *vc7 = [UIViewController new];
    vc7.view.backgroundColor = [UIColor purpleColor];
    model7.viewController = vc7;
    model7.title = @"紫色";
    
    self.pageView.models = @[];//model1, model2, model3, model4, model5, model6, model7];
}

#pragma mark - ZLScollPageViewDelegate

- (void)pageDidChanged:(NSInteger)page {
    SPDebugLog(@"swich to page %ld", (long)page);
}

@end
