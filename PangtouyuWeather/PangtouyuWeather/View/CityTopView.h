//
//  CityTopView.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/24.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HourInfoItemCell.h"

@interface CityTopView : UIView

@property (nonatomic,strong)UILabel *cityLabel;
@property (nonatomic,strong)UILabel *descriptionLabel;

@property (nonatomic,strong) Result *dataResult;
-(void)reloadDataForViewWithData:(Result *)result;

-(void)reSetFrame;



@end
