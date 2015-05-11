//
//  MainViewController.m
//  LawyerPlatform
//
//  Created by 任子丰 on 15/3/23.
//  Copyright (c) 2015年 LCWorld. All rights reserved.
//

/**
 *  屏幕高度
 */
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
/**
 *  屏幕高度
 */
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define kRGB(R,G,B)  ([UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1])
#define APP_COLOR kRGB(4, 162, 118)

#import "MainViewController.h"

@interface MainViewController ()
@property (strong, nonatomic) UIView *myTabbar;
@property (nonatomic, strong) ZFTabBarItem  *selectItem;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *selectImageArray;
@property (nonatomic, strong) NSArray *normalImageArray;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabbarIndex) name:@"tabbarIndex" object:nil];
}

- (void)createUI
{
    self.firstVC = [[FirstViewController alloc] init];
    self.firstNav = [[UINavigationController alloc] initWithRootViewController:self.firstVC];
    self.firstNav.delegate = self;
    
    self.secondVC= [[SecondViewController alloc] init];
    self.secondNav = [[UINavigationController alloc] initWithRootViewController:self.secondVC];
    self.secondNav.delegate = self;
    
    self.thirdVC = [[ThirdViewController alloc] init];
    self.thirdNav = [[UINavigationController alloc] initWithRootViewController:self.thirdVC];
    self.thirdNav.delegate = self;
    
    self.fourthVC = [[FourthViewController alloc] init];
    self.fourthNav = [[UINavigationController alloc] initWithRootViewController:self.fourthVC];
    self.fourthNav.delegate = self;
    self.viewControllers = [NSArray arrayWithObjects:self.firstNav,self.secondNav,self.thirdNav,self.fourthNav, nil];
    [self resetTabbar];
}
-(void)resetTabbar
{
    for (UIView * view in self.tabBar.subviews) {
        [view removeFromSuperview];
    }
    
    self.myTabbar = [[[NSBundle mainBundle] loadNibNamed:@"MyTabbar" owner:self options:nil] firstObject];
    self.myTabbar.frame = CGRectMake(0, 0, ScreenWidth, 49);
    [self.tabBar addSubview:self.myTabbar];
    self.myTabbar.layer.zPosition = 1;
    
    self.titleArray = @[@"消息",@"案源",@"发现",@"我的"];
    self.normalImageArray = @[@"03",@"02",@"04",@"01"];
    self.selectImageArray = @[@"003",@"002",@"004",@"001"];

    for (int i = 1; i < 5; i++) {
        ZFTabBarItem * bottomView = (ZFTabBarItem *)[self.myTabbar viewWithTag:i];
        bottomView.normalColor = [UIColor grayColor];
        bottomView.selectColor = APP_COLOR;
        bottomView.title = self.titleArray[i-1];
        bottomView.normalImage = [UIImage imageNamed:self.normalImageArray[i-1]];
        NSLog(@"%@",self.normalImageArray);
        
        bottomView.selectImage =[UIImage imageNamed:self.selectImageArray[i-1]];
        
        if (i == 1) {
            self.selectItem = bottomView;
            self.firstItem = bottomView;
        }else
        {
            if (i == 2) {
                self.secondItem = bottomView;
            }else if (i == 3) {
                self.thirdItem = bottomView;
            }else if (i == 4) {
                self.fourthItem = bottomView;
            }
            bottomView.isSelect = NO;
        }
        [bottomView addTarget:self action:@selector(tabbarClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
//tabbar按钮点击事件
-(void)tabbarClick:(ZFTabBarItem *)item
{
    self.selectedIndex = item.tag-1;
    self.selectItem = item;
}
-(void)setSelectItem:(ZFTabBarItem *)selectItem
{
    if (_selectItem != selectItem) {
        _selectItem.isSelect = NO;
        _selectItem = selectItem;
        _selectItem.isSelect = YES;
    }
}
/*
//创建初始化NA
- (void)setupTabbarController:(LCPanNavigationController *)navigationController disSelectImage:(NSString *)disSelectImage selectImage:(NSString *)selectImage title:(NSString *)title
{
    UIImage * disSelectImages = [UIImage imageNamed:disSelectImage];
    UIImage * selectImages = [UIImage imageNamed:selectImage];
    disSelectImages = [disSelectImages imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    selectImages = [selectImages imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:disSelectImages selectedImage:selectImages];
    self.tabBar.tintColor = [UIColor colorWithRed:52.0f/255.0f green:159.0f/255.0f blue:116.0f/255.0f alpha:1];
    navigationController.delegate = self;
   
    
    [self.view addSubview:self.messageNav.view];
}
 */
- (void)tabbarIndex
{
    self.selectedIndex = 1;
    self.selectItem = self.secondItem;
}
#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSInteger count = navigationController.viewControllers.count;
    if (count == 1) {
        [self.tabBar setHidden:NO];
    }else{
        [self.tabBar setHidden:YES];
    }
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
