//
//  LHSegmentView.h
//  LHSegment
//
//  Created by 刘浩 on 16/7/16.
//  Copyright © 2016年 com.lric.lldxhz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^action)(NSInteger index);

@interface LHSegmentView : UIView

@property (nonatomic, copy)action action;

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray AndAction:(action)action;

@end
