//
//  CityTopView.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/24.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "CityTopView.h"

@implementation CityTopView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

-(void)setUpUI{
    
    self.cityLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT_SELF * 0.3, SCREEN_WIDTH_SELF, SCREEN_HEIGHT_SELF * 0.4)];
    self.cityLabel.textAlignment = NSTextAlignmentCenter;
    self.cityLabel.textColor = ThemeColor;
    self.cityLabel.text = @"";
    self.cityLabel.font = [UIFont systemFontOfSize:32];
    [self addSubview:self.cityLabel];

    self.descriptionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT_SELF * 0.7, SCREEN_WIDTH_SELF, SCREEN_HEIGHT_SELF * 0.3)];
    self.descriptionLabel.textAlignment = NSTextAlignmentCenter;
    self.descriptionLabel.textColor = ThemeColor;
    self.descriptionLabel.text = @"";
    self.descriptionLabel.font = [UIFont systemFontOfSize:20];
    [self addSubview:self.descriptionLabel];
}

-(void)reSetFrame{
    self.cityLabel.frame = CGRectMake(0, SCREEN_HEIGHT_SELF * 0.3, SCREEN_WIDTH_SELF, SCREEN_HEIGHT_SELF * 0.4);
    self.descriptionLabel.frame = CGRectMake(0, SCREEN_HEIGHT_SELF * 0.7, SCREEN_WIDTH_SELF, SCREEN_HEIGHT_SELF * 0.3);
}


-(void)reloadDataForViewWithData:(Result *)result{
    self.cityLabel.text = result.city;
    self.descriptionLabel.text = [NSString stringWithFormat:@"%@",result.weather];
}
@end
