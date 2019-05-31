# ZLScrollPageView
传入包含视图控制器的模型数组可以实现左右滑动/按钮切换视图。

## Requirements

- iOS 8.0 or later

## Installation
#### Podfile
```
pod 'ZLScrollPageView', '1.0.1'
```

## How To Use

创建一个ZLScollPageView，将持有其的控制器设置为其代理。

```objective-c
#import <ZLScollPageView/ZLScollPageView.h>
#import <ZLScollPageView/ZLScollPageModel.h>
...
ZLScollPageView *pageView = [ZLScollPageView createWithDelegate:self];
```

传入ZLScollPageModel数组为其数据源models。

```objective-c
ZLScollPageModel *model1 = [ZLScollPageModel new];
UIViewController *vc1 = [UIViewController new];
vc1.view.backgroundColor = [UIColor redColor];
model1.viewController = vc1;
model1.title = @"红色";
pageView.models = @[model1];
```

## 效果图
![gif5](https://user-images.githubusercontent.com/12746854/43448731-3d07a1d2-94e1-11e8-9d3d-fbe21e0cf072.gif)
