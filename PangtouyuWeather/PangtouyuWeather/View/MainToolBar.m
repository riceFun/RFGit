//
//  MainToolBar.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/23.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "MainToolBar.h"

@implementation MainToolBar

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUpUI];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self setUpUI];
}

-(void)setUpUI{
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0.5)];
    lineView.backgroundColor = ThemeColor;
    [self addSubview:lineView];
    
    CGFloat intervelL = 3;
    
    CGFloat menuBtnHeight = SCREEN_HEIGHT_SELF - (2 * intervelL);
    CGFloat pageControlHeight = SCREEN_HEIGHT_SELF - (6 * intervelL);
    CGFloat pageControlWidth = SCREEN_WIDTH_SELF - (4 * intervelL) - (2 * menuBtnHeight);
    
    self.dataSourceBtn = [[UIButton alloc]initWithFrame:CGRectMake(intervelL, intervelL, menuBtnHeight, menuBtnHeight)];
    [self.dataSourceBtn setImage:UIIMAGE(@"menu.png") forState:UIControlStateNormal];
    [self addSubview:self.dataSourceBtn];
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake((2 * intervelL) + menuBtnHeight, 3 *intervelL, pageControlWidth, pageControlHeight)];
    self.pageControl.backgroundColor = [UIColor redColor];
    [self addSubview:self.pageControl];
    
    self.menuButton = [[UIButton alloc]initWithFrame:CGRectMake((3 * intervelL) + menuBtnHeight + pageControlWidth, intervelL, menuBtnHeight, menuBtnHeight)];
    [self.menuButton setImage:UIIMAGE(@"menu.png") forState:UIControlStateNormal];
    [self addSubview:self.menuButton];
    
}
@end
