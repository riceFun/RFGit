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
    
    self.updateTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 60, SCREEN_HEIGHT_SELF/3)];
    self.updateTimeLabel.textColor = ThemeColor;
    self.updateTimeLabel.textAlignment = NSTextAlignmentLeft;
    self.updateTimeLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.updateTimeLabel];
    
    self.locationImageView = [[UIImageView alloc]initWithFrame:CGRectMake(115, 0, SCREEN_HEIGHT_SELF/3, SCREEN_HEIGHT_SELF/3)];
    [self addSubview:self.locationImageView];
    
    self.cityLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, SCREEN_HEIGHT_SELF * 2 / 3, SCREEN_WIDTH_SELF - 120, INDEX_CELL_HEIGHT * 2 / 3)];
    self.cityLabel.textColor = ThemeColor;
    self.cityLabel.font = [UIFont systemFontOfSize:20];
    self.cityLabel.numberOfLines = 99;
    [self addSubview:self.cityLabel];
    
    self.tempLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH_SELF - 120, INDEX_CELL_HEIGHT/3, 120, INDEX_CELL_HEIGHT * 2 / 3)];
    self.tempLabel.textColor = ThemeColor;
    self.tempLabel.font = [UIFont systemFontOfSize:20];
    self.tempLabel.numberOfLines = 99;
    [self addSubview:self.tempLabel];
}


@end
