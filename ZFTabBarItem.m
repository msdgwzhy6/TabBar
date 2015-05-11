//
//  ZBTabBarItem.m
//  HHMedicalCare
//
//  Created by 任子丰 on 15/3/23.
//  Copyright (c) 2014年 任子丰. All rights reserved.
//

#import "ZFTabBarItem.h"

@implementation ZFTabBarItem


-(void)awakeFromNib
{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) - 15, CGRectGetWidth(self.frame), 15)];
        [self addSubview:_titleLable];
        _titleLable.backgroundColor = [UIColor clearColor];
        _titleLable.textColor = [UIColor grayColor];
        _titleLable.text = self.title;
        _titleLable.font = [UIFont systemFontOfSize:10];
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
    
    if (!_myImageView) {
        _myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 3, 27, 27)];
//        myImageView.center = CGPointMake(CGRectGetWidth(self.frame)/2, self.center.y - 7);
        _myImageView.image = self.normalImage;
        [self addSubview:_myImageView];
    
    }
}
-(void)layoutSubviews
{
    _myImageView.center = CGPointMake(CGRectGetWidth(self.frame)/2, self.center.y - 5);
}


-(void)setTitle:(NSString *)title
{
    if (_title != title) {
        _title = title;
        _titleLable.text = title;
    }
}
-(void)setNormalImage:(UIImage *)normalImage
{
    if (_normalImage != normalImage) {
        _normalImage = normalImage;
        _myImageView.image = _normalImage;
    }
}


-(void)setIsSelect:(BOOL)isSelect
{
    _isSelect = isSelect;
    if (_isSelect) {
        _titleLable.textColor = self.selectColor;
        _myImageView.image = self.selectImage;
    }else
    {
        _titleLable.textColor = self.normalColor;
        _myImageView.image = self.normalImage;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
