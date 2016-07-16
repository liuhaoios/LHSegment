//
//  ViewController.m
//  LHSegment
//
//  Created by 刘浩 on 16/7/16.
//  Copyright © 2016年 com.lric.lldxhz. All rights reserved.
//

#import "ViewController.h"
#import "LHSegmentView.h"
#import "UIView+Frame.h"

#define   WIN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define   WIN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *arr = @[@"杜伟娜",@"刘浩",@"天长地久"];
    
    LHSegmentView *views = [[LHSegmentView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 45) titleArray:arr AndAction:^(NSInteger index) {
        
    }];
    
    [self.navigationController.navigationBar addSubview:views];
}


@end
