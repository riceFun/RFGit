//
//  CityChooseView.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/30.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "CityChooseView.h"
#import "RFDataManager.h"

@implementation CityChooseView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self loadData];
        [self setUpUI];
        
       
    }
    return self;
}

-(NSArray *)cityArray{
    if (!_cityArray) {
        _cityArray = [NSArray array];
    }
    return _cityArray;
}

-(void)loadData{
    self.cityArray =  [[RFDataManager sharedInstance] getCityGoupArr];
}

-(void)setUpUI{
    self.backgroundColor = [UIColor redColor];
    self.allCityTableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
    self.allCityTableView.delegate = self;
    self.allCityTableView.dataSource = self;
    self.allCityTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self addSubview:self.allCityTableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.cityArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    CityGroup *cityGroup = self.cityArray[section];
    return cityGroup.cities.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"REUSECELL"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"REUSECELL"];
    }
    
    CityGroup *cityGroup = self.cityArray[indexPath.section];
    cell.textLabel.text = cityGroup.cities[indexPath.row];
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CityGroup *cityGroup = self.cityArray[section];
    return cityGroup.title;
}

//返回sectionIndexTitle//即右侧索引
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return [self.cityArray valueForKey:@"title"];//自动将每个对象中的title属行取出来作为一个数组
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectCity:)]) {
        CityGroup *cityGroup = self.cityArray[indexPath.section];
        [self.delegate didSelectCity:cityGroup.cities[indexPath.row]];
    }
}

@end
