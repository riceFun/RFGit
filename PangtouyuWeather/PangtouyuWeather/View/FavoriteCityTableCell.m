//
//  FavoriteCityTableCell.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/27.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "FavoriteCityTableCell.h"

@implementation FavoriteCityTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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
    
    self.updateTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 60, FAVORITE_CELL_HEIGHT/3)];
    self.updateTimeLabel.textColor = ThemeColor;
    self.updateTimeLabel.textAlignment = NSTextAlignmentLeft;
    self.updateTimeLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.updateTimeLabel];
    
    self.locationImageView = [[UIImageView alloc]initWithFrame:CGRectMake(60 + 15, 0, FAVORITE_CELL_HEIGHT/3, FAVORITE_CELL_HEIGHT/3)];
    [self addSubview:self.locationImageView];
    
    self.city_detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, FAVORITE_CELL_HEIGHT / 3, SCREEN_WIDTH_SELF - 100, FAVORITE_CELL_HEIGHT * 2 / 3)];
    self.city_detailLabel.textColor = ThemeColor;
    self.city_detailLabel.font = [UIFont systemFontOfSize:24];
    self.city_detailLabel.numberOfLines = 99;
    [self addSubview:self.city_detailLabel];
    
    self.tempLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH_SELF - 120, 0, 100, FAVORITE_CELL_HEIGHT)];
    self.tempLabel.textColor = ThemeColor;
    self.tempLabel.font = [UIFont systemFontOfSize:50];
    self.tempLabel.textAlignment = NSTextAlignmentRight;
    self.tempLabel.numberOfLines = 99;
    [self addSubview:self.tempLabel];
}


@end
