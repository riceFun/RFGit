//
//  FavoriteCityTableCell.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/27.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoriteCityTableCell : UITableViewCell
@property (nonatomic,strong) UILabel *updateTimeLabel;
@property (nonatomic,strong) UIImageView *locationImageView;
@property (nonatomic,strong) UILabel *city_detailLabel;
@property (nonatomic,strong) UILabel *tempLabel;

@end
