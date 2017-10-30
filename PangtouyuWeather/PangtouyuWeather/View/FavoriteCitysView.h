//
//  FavoriteCitysView.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/27.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoriteCityTableCell.h"
#import "FavoriteTableFooterView.h"

@protocol FavoriteCitysViewDelegate <NSObject>

-(void)didSelectCell:(NSIndexPath *)indexPath;

@end

@interface FavoriteCitysView : UIView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UIImageView *bgImageView;

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)FavoriteTableFooterView *tableFooterView;
@property (nonatomic,weak) id<FavoriteCitysViewDelegate> deleagate;


@end
