//
//  FavoriteTableFooterView.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/27.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "FavoriteTableFooterView.h"

@implementation FavoriteTableFooterView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = ContentBgColor;
        
        self.tempStlyeBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH_SELF/2 - 15, SCREEN_HEIGHT_SELF/3)];
        [self.tempStlyeBtn setTitle:@"°C/°F" forState:UIControlStateNormal];
        [self.tempStlyeBtn setTitle:@"°C/°F" forState:UIControlStateSelected];
        self.tempStlyeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self addSubview:self.tempStlyeBtn];
        
        self.addCityBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
        self.addCityBtn.frame = CGRectMake(SCREEN_WIDTH_SELF - SCREEN_HEIGHT_SELF/3 - 15, 0, SCREEN_HEIGHT_SELF/3, SCREEN_HEIGHT_SELF/3);
        [self addSubview:self.addCityBtn];
        
        self.tempStlyeBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH_SELF/2 - SCREEN_HEIGHT_SELF/3/2, SCREEN_HEIGHT_SELF/3, SCREEN_HEIGHT_SELF/3, SCREEN_HEIGHT_SELF/3)];
        [self.tempStlyeBtn setImage:UIIMAGE(@"3.png") forState:UIControlStateNormal];
        [self addSubview:self.tempStlyeBtn];
        
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_SELF, 0.3)];
        lineView.backgroundColor = ThemeColor;
        [self addSubview:lineView];
        
    }
    return self;
}

@end
