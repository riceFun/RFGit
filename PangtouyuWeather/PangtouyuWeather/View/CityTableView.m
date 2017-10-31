//
//  CityTableView.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/23.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "CityTableView.h"
static NSString *CityHourInfoTableCellID = @"CityHourInfoTableCellID";
static NSString *HourCellID = @"HourInfoItemCellID";
static NSString *DayInfoTableCellID = @"DayInfoTableCellID";
static NSString *FullDescriptionCellID = @"FullDescriptionCellID";
static NSString *DetailDescriptionCellID = @"DetailDescriptionCellID";
static NSString *IndexCellID = @"IndexCellIDl";

static NSString *hourInfoItemCellID = @"HourInfoItemCellID";


@implementation CityTableView
-(UIView *)cityTableHeaderView{
    if (!_cityTableHeaderView) {
        _cityTableHeaderView = [[CityHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_SELF, 200)];
    }
    return _cityTableHeaderView;
}

-(Result *)dataResult{
    if (!_dataResult) {
        _dataResult = [[Result alloc]init];
    }
    return _dataResult;
}

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
    self.cityTopView = [[CityTopView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_SELF, SCREEN_HEIGHT_SELF * 0.25)];
    [self addSubview:self.cityTopView];
    
    self.cityInfoTableVeiw = [[UITableView alloc]initWithFrame:CGRectMake(0,  SCREEN_HEIGHT_SELF * 0.25, SCREEN_WIDTH_SELF, SCREEN_HEIGHT_SELF * 0.75) style:(UITableViewStylePlain)];
    self.cityInfoTableVeiw.tableHeaderView = self.cityTableHeaderView;
    self.cityInfoTableVeiw.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    self.cityInfoTableVeiw.backgroundColor = ContentBgColor;
    self.cityInfoTableVeiw.delegate = self;
    self.cityInfoTableVeiw.dataSource = self;
    self.cityInfoTableVeiw.separatorColor = ThemeColor;
    [self addSubview:self.cityInfoTableVeiw];
}

#pragma mark UITableViewDelagate && UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return self.dataResult.daily.count;
    }else if (section == 2){
        if (self.dataResult.city == nil) {
            return 0;
        }
        return 1;
    }else if (section == 3){
        if (self.dataResult.city == nil) {
            return 0;
        }
        return 6;
        
    }else if (section == 4){
        return self.dataResult.index.count;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            CityHourInfoTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CityHourInfoTableCellID];
            if (!cell) {
                cell = [[CityHourInfoTableCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:CityHourInfoTableCellID];
                cell.preservesSuperviewLayoutMargins = NO;
                cell.separatorInset = UIEdgeInsetsZero;
                cell.layoutMargins = UIEdgeInsetsZero;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            [cell reloadDataForViewWithData:self.dataResult];

            return cell;
        }
            break;
        case 1:{
            DayInfoTableCell *cell = [tableView dequeueReusableCellWithIdentifier:DayInfoTableCellID];
            if (!cell) {
                cell = [[DayInfoTableCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:DayInfoTableCellID];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            Daily *daily = self.dataResult.daily[indexPath.row];
            cell.weekLabel.text = daily.week;
            cell.dayLabel.hidden = YES;
            cell.minTempLabel.text = daily.night.templow;
            cell.maxTempLabel.text = daily.day.temphigh;
            if (indexPath.row == 6) { //使分割线顶头
                cell.preservesSuperviewLayoutMargins = NO;
                cell.separatorInset = UIEdgeInsetsZero;
                cell.layoutMargins = UIEdgeInsetsZero;
            }
            
            return cell;
        }
            break;
        case 2:{
            IndexTableCell *cell = [tableView dequeueReusableCellWithIdentifier:FullDescriptionCellID];
            if (!cell) {
                cell = [[IndexTableCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:FullDescriptionCellID];
                cell.backgroundColor = ContentBgColor;
                cell.textLabel.textColor = ThemeColor;
                cell.textLabel.numberOfLines = 99;
                cell.preservesSuperviewLayoutMargins = NO;
                cell.separatorInset = UIEdgeInsetsZero;
                cell.layoutMargins = UIEdgeInsetsZero;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            cell.iNameLabel.text = @"空气质量";
            cell.iValueLabel.text = self.dataResult.aqi.quality;
            cell.iDtailLabel.text = self.dataResult.aqi.aqiinfo.measure;
            
            return cell;
        }
            break;
        case 3:{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailDescriptionCellID];
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:DetailDescriptionCellID];
                cell.backgroundColor = ContentBgColor;
                cell.textLabel.textColor = ThemeColor;
                cell.detailTextLabel.textColor = ThemeColor;
                cell.textLabel.numberOfLines = 99;
                cell.textLabel.font = [UIFont systemFontOfSize:12];
                cell.detailTextLabel.font = [UIFont systemFontOfSize:26];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            if (indexPath.row == 0) {
                cell.textLabel.text = @"日出";
                Daily *daily = self.dataResult.daily[0];
                cell.detailTextLabel.text = daily.sunrise;
            }else if (indexPath.row == 1){
                cell.textLabel.text = @"日落";
                Daily *daily = self.dataResult.daily[0];
                cell.detailTextLabel.text = daily.sunset;
            }else if (indexPath.row == 2){
                cell.textLabel.text = @"PM2.5";
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ 毫克/立方米",self.dataResult.aqi.pm2_5];
            }else if (indexPath.row == 3){
                cell.textLabel.text = @"湿度";
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%@%%",self.dataResult.humidity];
            }else if (indexPath.row == 4){
                cell.textLabel.text =@"气压";
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%@百帕",self.dataResult.pressure];
            }else if (indexPath.row == 5){
                cell.textLabel.text = @"风速";
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@米/秒",self.dataResult.winddirect,self.dataResult.windspeed];
            }
            
            return cell;
        }
            break;
        case 4:{
            IndexTableCell *cell = [tableView dequeueReusableCellWithIdentifier:IndexCellID];
            if (!cell) {
                cell = [[IndexTableCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:IndexCellID];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            LifeIndex *index = self.dataResult.index[indexPath.row];
            cell.iNameLabel.text = index.iname;
            cell.iValueLabel.text = index.ivalue;
            cell.iDtailLabel.text = index.detail;
            return cell;
        }
            break;
            
        default:
            break;
    }
    return nil;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 150;
    }else if (indexPath.section == 1){
        return 44;
    }else if (indexPath.section == 2){
        return INDEX_CELL_HEIGHT;
    }else if (indexPath.section == 3){
        return 60;
    }else if (indexPath.section == 4){
        return INDEX_CELL_HEIGHT;
    }
    return 0;
}

//消除section之间的间距
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.cityInfoTableVeiw) {
        CGFloat offSetChange = 50 - scrollView.contentOffset.y;
        if (offSetChange < 0) return;
        CGFloat pChange = offSetChange/50;
        //改变透明度
        self.cityTableHeaderView.alpha = pChange;
//        [self.cityTableHeaderView changeAlpha:pChange];
        //改变位置
        CGFloat frameChangeValue = 50 * (1 - pChange);        
        self.cityTopView.frame = CGRectMake(0, 0, SCREEN_WIDTH_SELF, SCREEN_HEIGHT_SELF * 0.25 - frameChangeValue);
        [self.cityTopView reSetFrame];
        self.cityInfoTableVeiw.frame = CGRectMake(0,  SCREEN_HEIGHT_SELF * 0.25 - frameChangeValue, SCREEN_WIDTH_SELF, SCREEN_HEIGHT_SELF * 0.75 + frameChangeValue);
    }
}

-(void)reloadDataForViewWithData:(Result *)result{
    self.dataResult = result;
    [self.cityTopView reloadDataForViewWithData:result];
    [self.cityTableHeaderView reloadDataForViewWithData:result];
    [self.cityInfoTableVeiw reloadData];
}
@end
