//
//  FavoriteCitysView.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/27.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "FavoriteCitysView.h"

static NSString *FavoriteCityTableCellID = @"FavoriteCityTableCellID";

@implementation FavoriteCitysView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = ContentBgColor;
        self.bgImageView = [[UIImageView alloc]initWithFrame:self.bounds];
        self.bgImageView.image = UIIMAGE(@"kkkk");
        [self addSubview:self.bgImageView];
        
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH_SELF, SCREEN_HEIGHT_SELF - 20) style:UITableViewStylePlain];
        self.tableView.backgroundColor = ContentBgColor;
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.tableFooterView = self.tableFooterView;
        [self addSubview:self.tableView];
    }
    return self;
}

-(FavoriteTableFooterView *)tableFooterView{
    if (!_tableFooterView) {
        _tableFooterView = [[FavoriteTableFooterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_SELF, 80)];
    }
    return _tableFooterView;
}


#pragma mark UITableViewDelegate & DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FavoriteCityTableCell *cell = [tableView dequeueReusableCellWithIdentifier:FavoriteCityTableCellID];
    if (!cell) {
        cell = [[FavoriteCityTableCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:FavoriteCityTableCellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.updateTimeLabel.text = @"10:10";
    cell.locationImageView.image = UIIMAGE(@"3.png");
    cell.cityLabel.text = @"杭州";
    cell.tempLabel.text = @"17";
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.deleagate && [self.deleagate respondsToSelector:@selector(didSelectCell:)]) {
        [self.deleagate didSelectCell:indexPath];
    }
}

@end
