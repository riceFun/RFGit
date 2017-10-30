//
//  IndexTableCell.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/26.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "IndexTableCell.h"

@implementation IndexTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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
    
    self.iNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH_SELF/2 - 15, INDEX_CELL_HEIGHT/3)];
    self.iNameLabel.textColor = ThemeColor;
    self.iNameLabel.textAlignment = NSTextAlignmentLeft;
    self.iNameLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.iNameLabel];
    
    self.iValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH_SELF/2 - 15, 0, SCREEN_WIDTH_SELF/2 - 15, INDEX_CELL_HEIGHT/3)];
    self.iValueLabel.textColor = ThemeColor;
    self.iValueLabel.textAlignment = NSTextAlignmentRight;
    self.iValueLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.iValueLabel];
    
    self.iDtailLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, INDEX_CELL_HEIGHT/3, SCREEN_WIDTH_SELF - 30, INDEX_CELL_HEIGHT * 2 / 3)];
    self.iDtailLabel.textColor = ThemeColor;
    self.iDtailLabel.font = [UIFont systemFontOfSize:20];
    self.iDtailLabel.numberOfLines = 99;
    [self addSubview:self.iDtailLabel];
}


@end
