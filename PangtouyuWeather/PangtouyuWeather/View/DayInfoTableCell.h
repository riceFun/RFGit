//
//  DayInfoTableCell.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/23.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DayInfoTableCell : UITableViewCell

@property (nonatomic,strong)UILabel *weekLabel;
@property (nonatomic,strong)UILabel *dayLabel;//eg: 今天 10/28
@property (nonatomic,strong)UIImageView *weatherIconImageView;
@property (nonatomic,strong)UILabel *minTempLabel;
@property (nonatomic,strong)UILabel *maxTempLabel;

@end
