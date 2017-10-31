//
//  CityChooseView.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/30.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CityChooseViewDelegate <NSObject>
-(void)didSelectCity:(NSString *)city;
@end

@interface CityChooseView : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *allCityTableView;

@property (nonatomic,weak) id <CityChooseViewDelegate> delegate;

@property (nonatomic,strong)NSArray *cityArray;

@end
