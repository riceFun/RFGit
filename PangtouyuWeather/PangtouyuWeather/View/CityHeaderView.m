//
//  CityHeaderView.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/23.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "CityHeaderView.h"

@implementation CityHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = ContentBgColor;
        
        self.tempretureLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH_SELF, SCREEN_HEIGHT_SELF - 44)];
        self.tempretureLabel.textColor = ThemeColor;
        self.tempretureLabel.text = @"--";
        self.tempretureLabel.textAlignment = NSTextAlignmentCenter;
        self.tempretureLabel.font = [UIFont systemFontOfSize:100];
        [self addSubview:self.tempretureLabel];
        
        self.weekLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, SCREEN_HEIGHT_SELF - 44, SCREEN_WIDTH_SELF * 0.2, 44)];
        self.weekLabel.textColor = ThemeColor;
        self.weekLabel.text = @"--";
        [self addSubview:self.weekLabel];
        
        self.dayLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH_SELF * 0.2 + 15, SCREEN_HEIGHT_SELF - 44, SCREEN_WIDTH_SELF * 0.15, 44)];
        self.dayLabel.textColor = ThemeColor;
        self.dayLabel.text = @"--";
        [self addSubview:self.dayLabel];
        
        self.minTempLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH_SELF *0.8,SCREEN_HEIGHT_SELF - 44, SCREEN_WIDTH_SELF * 0.1, 44)];
        self.minTempLabel.textColor = ThemeColor;
        self.minTempLabel.text = @"--";
        [self addSubview:self.minTempLabel];
        
        self.maxTempLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH_SELF *0.9,SCREEN_HEIGHT_SELF - 44, SCREEN_WIDTH_SELF * 0.1, 44)];
        self.maxTempLabel.textColor = ThemeColor;
        self.maxTempLabel.text = @"--";
        [self addSubview:self.maxTempLabel];
        
    }
    return self;
}

-(void)changeAlpha:(CGFloat)alpha{
    self.tempretureLabel.alpha = alpha;
    self.weekLabel.alpha = alpha;
    self.dayLabel.alpha = alpha;
    self.minTempLabel.alpha = alpha;
    self.maxTempLabel.alpha = alpha;
}

-(void)reloadDataForViewWithData:(Result *)result{
    self.tempretureLabel.text = [NSString stringWithFormat:@"%@°",result.temp];
    self.weekLabel.text = result.week;
    self.dayLabel.text = @"今天";
    self.minTempLabel.text = result.templow;
    self.maxTempLabel.text = result.temphigh;
}


@end
