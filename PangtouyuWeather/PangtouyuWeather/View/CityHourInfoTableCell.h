//
//  CityHourInfoTableCell.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/23.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HourInfoItemCell.h"

@interface CityHourInfoTableCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView *hourInfoCellectionView;

@property (nonatomic,strong) Result *dataResult;
-(void)reloadDataForViewWithData:(Result *)result;

@end
