//
//  ZLScollPageTitleView.m
//  ZLScollPageVC
//
//  Created by 赵雷 on 2017/10/30.
//  Copyright © 2017年 com.zlfw.ZLScollPageVC All rights reserved.
//

#import "ZLScollPageTitleView.h"
#import "SPConstant.h"

@interface ZLScollPageTitleView ()

@property (nonatomic, strong) NSArray <UIButton *> *buttons;

@property (nonatomic, weak) UIImageView *bottomLine;

@property (nonatomic, weak) UIImageView *selectLine;

@property (nonatomic, assign) CGFloat btnW;

@end

@implementation ZLScollPageTitleView

- (void)setHeight:(CGFloat)height {
    _height = height;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}

- (void)setTitles:(NSArray<NSString *> *)titles {
    _titles = titles;
    for (UIButton *button in self.buttons) {
        [button removeFromSuperview];
    }
    NSMutableArray *buttons = [NSMutableArray array];
    for (int i = 0; i < titles.count; i++) {
        int tag = i + 1;
        NSString *title = titles[i];
        UIButton *titleBtn = [self addBtnWithTitle:title tag:tag];
        titleBtn.titleLabel.font = self.titleFont;
        [buttons addObject:titleBtn];
    }
    self.buttons = buttons.copy;
    if (self.buttons.count > 0) {
        self.buttons.firstObject.selected = YES;
    }
    self.indicateLineLocal = self.indicateLineLocal;
}

- (void)relayoutButtons {
    NSInteger buttonsCount = self.buttons.count;
    if (buttonsCount) {
        CGFloat btnW = SP_SCREEN_WIDTH / buttonsCount;
        CGFloat contentSizeW = 0;
        CGFloat btnMinW = SP_SCREEN_WIDTH / 4.5;
        if (buttonsCount > 4) {
            btnW = btnMinW;
            contentSizeW = btnMinW * buttonsCount;
        }
        for (int i = 0; i < buttonsCount; i++) {
            CGFloat x = btnW * i;
            CGRect frame = CGRectMake(x, 0, btnW, self.height);
            self.buttons[i].frame = frame;
        }
        self.contentSize = CGSizeMake(contentSizeW, 0);
        self.btnW = btnW;
    }
}

- (void)setIndicateLineLocal:(ZLScollPageIndicateLineLocal)indicateLineLocal {
    _indicateLineLocal = indicateLineLocal;
    [self relayoutSelectLine];
}

- (void)relayoutSelectLine {
    if (self.buttons.count) {
        UIButton *seletedBtn = nil;
        for (UIButton *button in self.buttons) {
            if (button.selected) {
                seletedBtn = button;
                break;
            }
        }
        CGFloat lineY = 0;
        CGFloat lineWidth = 0;
        CGFloat lineHeight = 2;
        
        if (self.indicateLineLocal == ZLScollPageIndicateLineBottom) {
            lineWidth = self.btnW;
            lineY = self.height - lineHeight;
            self.selectLine.hidden = NO;
        } else if (self.indicateLineLocal == ZLScollPageIndicateLineUnderTitle) {
            CGFloat offset = 2;
            CGSize titleSize = [@"四字标题" sizeWithAttributes:@{NSFontAttributeName : self.titleFont}];
            lineWidth = titleSize.width + offset;
            lineY = (self.height + titleSize.height) * 0.5 + offset - lineHeight;
            self.selectLine.hidden = NO;
        }
        self.selectLine.frame = CGRectMake(0, lineY, lineWidth, lineHeight);
        self.selectLine.center = CGPointMake(seletedBtn.center.x, self.selectLine.center.y);
    }
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    for (UIButton *button in self.buttons) {
        button.titleLabel.font = titleFont;
    }
}

- (void)setBtnBgColor:(UIColor *)btnBgColor {
    _btnBgColor = btnBgColor;
    for (UIButton *button in self.buttons) {
        button.backgroundColor = btnBgColor;
    }
}

- (void)setSelectedColor:(UIColor *)selectedColor {
    _selectedColor = selectedColor;
    for (UIButton *button in self.buttons) {
        [button setTitleColor:selectedColor forState:UIControlStateSelected];
    }
}

- (void)setUnSelectedColor:(UIColor *)unSelectedColor {
    _unSelectedColor = unSelectedColor;
    for (UIButton *button in self.buttons) {
        [button setTitleColor:unSelectedColor forState:UIControlStateNormal];
    }
}

- (void)setSelectLineColor:(UIColor *)selectLineColor {
    _selectLineColor = selectLineColor;
    self.selectLine.backgroundColor = selectLineColor;
}

- (void)setBottomLineColor:(UIColor *)bottomLineColor {
    _bottomLineColor = bottomLineColor;
    self.bottomLine.backgroundColor = bottomLineColor;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self config];
    }
    return self;
}

- (void)config {
    self.backgroundColor = [UIColor whiteColor];
    
    _btnBgColor = UIColor.whiteColor;
    _selectedColor = UIColor.redColor;
    _unSelectedColor = UIColor.grayColor;
    _indicateLineLocal = ZLScollPageIndicateLineBottom;
    _selectLineColor = UIColor.redColor;
    _bottomLineColor = UIColor.grayColor;
    _height = 40;
    _titleFont = [UIFont systemFontOfSize:14];
    
    UIImageView *selectLine = [UIImageView new];
    selectLine.hidden = YES;
    selectLine.backgroundColor = UIColor.redColor;
    [self addSubview:selectLine];
    self.selectLine = selectLine;
    
    UIImageView *bottomLine = [UIImageView new];
    bottomLine.backgroundColor = UIColor.grayColor;
    [self addSubview:bottomLine];
    self.bottomLine = bottomLine;
    
    self.bounces = NO;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
}

- (UIButton *)addBtnWithTitle:(NSString *)title tag:(NSInteger)tag {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:button];
    button.tag = tag;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:self.selectedColor forState:UIControlStateSelected];
    [button setTitleColor:self.unSelectedColor forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)btnClicked:(UIButton *)sender {
    if (!sender.isSelected) {
        [self selectedButtonChangedWithBtn:sender];
        if (self.btnAction) {
            self.btnAction(sender.tag);
        }
    }
}

- (void)selectedButtonChanged:(NSInteger)tag {
    UIButton *seletedBtn = nil;
    for (UIButton *button in self.buttons) {
        if (button.tag == tag) {
            seletedBtn = button;
            break;
        }
    }
    [self selectedButtonChangedWithBtn:seletedBtn];
}

- (void)selectedButtonChangedWithBtn:(UIButton *)seletedBtn {
    if (seletedBtn) {
        if (!seletedBtn.isSelected) {
            for (UIButton *button in self.buttons) {
                button.selected = button == seletedBtn;
            }
            CGPoint contentOffset = self.contentOffset;
            CGRect btnFrame = seletedBtn.frame;
            if (self.titles.count > 4) {
                if (seletedBtn.tag == self.titles.count) {
                    contentOffset = CGPointMake(CGRectGetMaxX(btnFrame) - SP_SCREEN_WIDTH, 0);
                } else if (seletedBtn.tag == 1) {
                    contentOffset = CGPointMake(0, 0);
                } else {
                    CGFloat showMax = self.contentOffset.x + SP_SCREEN_WIDTH - 0.01;
                    CGFloat showMin = self.contentOffset.x + 0.01;
                    CGFloat btnW = btnFrame.size.width;
                    if (CGRectGetMinX(btnFrame) < showMin) {
                        contentOffset = CGPointMake(CGRectGetMinX(btnFrame) - btnW * 0.5, 0);
                    }
                    if (CGRectGetMaxX(btnFrame) > showMax) {
                        contentOffset = CGPointMake(CGRectGetMaxX(btnFrame) + btnW * 0.5 - SP_SCREEN_WIDTH, 0);
                    }
                }
            }
            [UIView animateWithDuration:0.3 animations:^{
                self.contentOffset = contentOffset;
                self.selectLine.center = CGPointMake(seletedBtn.center.x, self.selectLine.center.y);
            }];
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self relayoutButtons];
    [self relayoutSelectLine];
    CGFloat lineH = 1;
    self.bottomLine.frame = CGRectMake(0, self.frame.size.height - lineH, self.contentSize.width, lineH);
}

@end
