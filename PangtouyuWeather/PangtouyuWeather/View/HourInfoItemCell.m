//
//  HourInfoItemCell.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/20.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "HourInfoItemCell.h"

@implementation HourInfoItemCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self){
        [self setUpUI];
    }
    
    return  self;
}

-(void)setUpUI{
    self.backgroundColor = ContentBgColor;
    
    self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_SELF, SCREEN_HEIGHT_SELF/3)];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLabel.backgroundColor = ContentBgColor;
    self.timeLabel.textColor = ThemeColor;
    [self addSubview:self.timeLabel];
    
    self.weatherInfoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,SCREEN_HEIGHT_SELF/3, SCREEN_WIDTH_SELF, SCREEN_HEIGHT_SELF/3)];
    self.weatherInfoImageView.image = UIIMAGE(@"1.png");
    self.weatherInfoImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:self.weatherInfoImageView];
    
    self.tempOrDecripLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT_SELF * 2/3, SCREEN_WIDTH_SELF, SCREEN_HEIGHT_SELF/3)];
    self.tempOrDecripLabel.backgroundColor = ContentBgColor;
    self.tempOrDecripLabel.textAlignment = NSTextAlignmentCenter;
    self.tempOrDecripLabel.textColor = ThemeColor;
    [self addSubview:self.tempOrDecripLabel];
}

@end
