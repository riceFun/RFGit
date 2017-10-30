//
//  MainView.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/23.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityTableView.h"
#import "MainToolBar.h"
#import "Result.h"

@interface MainView : UIView
@property (nonatomic,strong) UIImageView *bgImageView;//背景图片
@property (nonatomic,strong) CityTableView *cityTableView;
@property (nonatomic,strong) MainToolBar *toolBar;

-(void)reloadDataForViewWithData:(Result *)result;

@end
