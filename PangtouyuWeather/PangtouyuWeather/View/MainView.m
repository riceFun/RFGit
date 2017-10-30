//
//  MainView.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/23.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "MainView.h"

@implementation MainView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUpUI];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self setUpUI];
}

-(void)setUpUI{
    
    self.bgImageView = [[UIImageView alloc]initWithFrame:self.bounds];
    self.bgImageView.image = UIIMAGE(@"kkkk.png");
    [self addSubview:self.bgImageView];
    
    self.cityTableView = [[CityTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_SELF, SCREEN_HEIGHT_SELF * 0.925)];
    self.cityTableView.backgroundColor = ContentBgColor;
    [self addSubview:self.cityTableView];
    
    self.toolBar = [[MainToolBar alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT_SELF * 0.925, SCREEN_WIDTH_SELF, SCREEN_HEIGHT_SELF * 0.075)];
    [self addSubview:self.toolBar];
}

-(void)reloadDataForViewWithData:(Result *)result{
    [self.cityTableView reloadDataForViewWithData:result];
    
}


@end
