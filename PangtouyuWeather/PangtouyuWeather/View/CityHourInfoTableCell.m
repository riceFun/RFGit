//
//  CityHourInfoTableCell.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/23.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "CityHourInfoTableCell.h"
static NSString *hourInfoItemCellID = @"HourInfoItemCellID";

@implementation CityHourInfoTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    return self;
}

-(Result *)dataResult{
    if (!_dataResult) {
        _dataResult = [[Result alloc]init];
    }
    return _dataResult;
}

-(void)setUpUI{
    self.backgroundColor = ContentBgColor;
    
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc]init];
    flowLayOut.itemSize = CGSizeMake(SCREEN_WIDTH/5 - 5, 150);
    flowLayOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.hourInfoCellectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150) collectionViewLayout:flowLayOut];
    self.hourInfoCellectionView.backgroundColor = ContentBgColor;
    self.hourInfoCellectionView.delegate = self;
    self.hourInfoCellectionView.dataSource = self;
    
    //注册Cell
    [self.hourInfoCellectionView registerClass:[HourInfoItemCell class] forCellWithReuseIdentifier:hourInfoItemCellID];
    [self addSubview:self.hourInfoCellectionView];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = ThemeColor;
    [self addSubview:lineView];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataResult.hourly.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HourInfoItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:hourInfoItemCellID forIndexPath:indexPath];

    if (indexPath.item == 0) {
        cell.timeLabel.text = @"现在";
        cell.weatherInfoImageView.image = UIIMAGE(self.dataResult.img);
        cell.tempOrDecripLabel.text = [NSString stringWithFormat:@"%@°",self.dataResult.temp];
    }else{
        Hourly *hourly = self.dataResult.hourly[indexPath.item - 1];
        cell.timeLabel.text = hourly.time;
        cell.weatherInfoImageView.image = UIIMAGE(hourly.img);
        cell.tempOrDecripLabel.text = [NSString stringWithFormat:@"%@°",hourly.temp];
    }
    return cell;
}

-(void)reloadDataForViewWithData:(Result *)result{
    self.dataResult = result;
    [self.hourInfoCellectionView reloadData];
}

@end
