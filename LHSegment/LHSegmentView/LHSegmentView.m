//
//  LHSegmentView.m
//  LHSegment
//
//  Created by 刘浩 on 16/7/16.
//  Copyright © 2016年 com.lric.lldxhz. All rights reserved.
//

#import "LHSegmentView.h"
#import "UIView+Frame.h"

#define   WIN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define   WIN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface LHSegmentView ()
{
    NSArray *_titleArray;
    CGRect _viewRect;
}
@property(nonatomic,strong)UIView *selectedLine;

@end

CGFloat titleFontsize = 17.0;

@implementation LHSegmentView

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray AndAction:(action)action {

    if (self = [super initWithFrame:frame]) {
        _titleArray = titleArray;
        _viewRect = frame;
        self.action = action;
        [self lineView];
        [self topButtonView];
    }
    return self;
}

- (void)lineView {
    CGFloat width =(WIN_WIDTH - 1) / _titleArray.count;
    
    UIView *selectedLine = [[UIView alloc] initWithFrame:CGRectMake(10, _viewRect.size.height - 2, width - 20, 2)];
    _selectedLine = selectedLine;
    _selectedLine.backgroundColor = [UIColor redColor];
    [self addSubview:_selectedLine];
}

- (void)topButtonView {
    
    CGFloat width =(WIN_WIDTH - 1) / _titleArray.count;
    CGFloat lineMargin = 0.5;
    
    for (int i = 0 ; i < _titleArray.count; i ++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((lineMargin + width) * i , 0, width, _viewRect.size.height)];
        [self addSubview:btn];
        btn.tag = 100 + i;
        if (i == 0) {
            btn.selected = YES;
        }
        [btn setTitle:_titleArray[i] forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:titleFontsize]];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(swicthOrderWithButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

- (void)swicthOrderWithButton:(UIButton *)selectBtn {
    for (int i = 0; i< 3; i++) {
        UIButton* btn = (UIButton *)[self viewWithTag:100 + i];
        btn.selected = NO;
    }
    selectBtn.selected = YES;
    
    [UIView animateWithDuration:0.2 animations:^{
        _selectedLine.centerX = selectBtn.centerX;
    }];
    
    if (_action) {
        _action(selectBtn.tag - 100);
    }
}

@end
