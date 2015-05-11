//
//  FirstViewController.m
//  tabBar
//
//  Created by 任子丰 on 15/4/9.
//  Copyright (c) 2015年 LCWorld. All rights reserved.
//

#import "FirstViewController.h"
#import "SDCycleScrollView.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
/**
 *  屏幕高度
 */
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // 情景一：采用本地图片实现
    NSArray *images = @[[UIImage imageNamed:@"banner-1副本.jpg"],
                        [UIImage imageNamed:@"banner-2副本.jpg"],
                        [UIImage imageNamed:@"banner-3副本.jpg"],
                        [UIImage imageNamed:@"banner-4副本.jpg"]
                        ];
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 55, ScreenWidth, 180) imagesGroup:images];
//    cycleScrollView.delegate = self;
    [self.view addSubview:cycleScrollView];
    //         --- 轮播时间间隔，默认1.0秒，可自定义
    cycleScrollView.autoScrollTimeInterval = 2.0;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
