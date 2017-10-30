//
//  CityTableView.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/23.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HourInfoItemCell.h"
#import "DayInfoTableCell.h"
#import "CityHourInfoTableCell.h"
#import "IndexTableCell.h"
#import "CityHeaderView.h"
#import "CityTopView.h"

@interface CityTableView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) CityTopView *cityTopView;
@property (nonatomic,strong) CityHeaderView *cityTableHeaderView;
@property (nonatomic,strong) UITableView *cityInfoTableVeiw;

@property (nonatomic,strong) Result *dataResult;
-(void)reloadDataForViewWithData:(Result *)result;

@end
