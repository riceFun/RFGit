//
//  DayInfoTableCell.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/23.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "DayInfoTableCell.h"

@implementation DayInfoTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    return self;
}


-(void)setUpUI{
    self.backgroundColor = ContentBgColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.weekLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH_SELF * 0.2, SCREEN_HEIGHT_SELF)];
    self.weekLabel.textColor = ThemeColor;
    [self addSubview:self.weekLabel];
    
    self.dayLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH_SELF * 0.2 + 15, 0, SCREEN_WIDTH_SELF * 0.15, SCREEN_HEIGHT_SELF)];
    self.dayLabel.textColor = ThemeColor;
    self.dayLabel.text = @"今天";
    [self addSubview:self.dayLabel];
    
    CGFloat iconHeight = SCREEN_HEIGHT_SELF - 3;
    self.weatherIconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH_SELF*0.5 - iconHeight/2 , 3, iconHeight, iconHeight)];
    self.weatherIconImageView.image = UIIMAGE(@"1.png");
    [self addSubview:self.weatherIconImageView];
    
    self.minTempLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH_SELF *0.8,0, SCREEN_WIDTH_SELF * 0.1, SCREEN_HEIGHT_SELF)];
    self.minTempLabel.textColor = ThemeColor;
    [self addSubview:self.minTempLabel];
    
    self.maxTempLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH_SELF *0.9,0, SCREEN_WIDTH_SELF * 0.1, SCREEN_HEIGHT_SELF)];
    self.maxTempLabel.textColor = ThemeColor;
    [self addSubview:self.maxTempLabel];
    
    
}


@end
