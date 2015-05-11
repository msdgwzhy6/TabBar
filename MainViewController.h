//
//  MainViewController.h
//  LawyerPlatform
//
//  Created by 任子丰 on 15/3/23.
//  Copyright (c) 2015年 LCWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "ZFTabBarItem.h"

@interface MainViewController : UITabBarController<UINavigationControllerDelegate>

@property (nonatomic, strong) FirstViewController * firstVC;
@property (nonatomic, strong) SecondViewController * secondVC;
@property (nonatomic, strong) ThirdViewController * thirdVC;
@property (nonatomic, strong) FourthViewController * fourthVC;

@property (nonatomic, strong) UINavigationController * firstNav;
@property (nonatomic, strong) UINavigationController * secondNav;
@property (nonatomic, strong) UINavigationController * thirdNav;
@property (nonatomic, strong) UINavigationController * fourthNav;
@property (nonatomic, strong) ZFTabBarItem * firstItem;
@property (nonatomic, strong) ZFTabBarItem * secondItem;
@property (nonatomic, strong) ZFTabBarItem * thirdItem;
@property (nonatomic, strong) ZFTabBarItem * fourthItem;
@end
