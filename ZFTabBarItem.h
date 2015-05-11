//
//  ZBTabBarItem.h
//  HHMedicalCare
//
//  Created by 任子丰 on 15/3/23.
//  Copyright (c) 2014年 任子丰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFTabBarItem : UIControl

@property (nonatomic, strong) UILabel *titleLable;;
@property (nonatomic, strong) UIImageView *myImageView;

@property (nonatomic, assign) BOOL       isSelect;
@property (nonatomic, strong) NSString  *title;
@property (nonatomic, strong) UIColor   *normalColor;
@property (nonatomic, strong) UIColor   *selectColor;
@property (nonatomic, strong) UIImage   *normalImage;
@property (nonatomic, strong) UIImage   *selectImage;
@end
