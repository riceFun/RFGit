//
//  RFDataManager.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/30.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "RFDataManager.h"
#import "FavoriteCityModel.h"


@implementation RFDataManager

+(RFDataManager *)sharedInstance{
    static RFDataManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}



-(NSArray *)getCityGoupArr{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"cityGroups.plist" ofType:nil];
    NSArray *cityGroupArray = [NSArray arrayWithContentsOfFile:plistPath];
    
    NSMutableArray *mutalbeArray = [NSMutableArray array];
    for (NSDictionary *dic in cityGroupArray) {
        //声明一个空的CityGroup对象
        CityGroup *cityGroup = [CityGroup new];
        //利用KVC绑定模型对象和字典的关系
        [cityGroup setValuesForKeysWithDictionary:dic];
        [mutalbeArray addObject:cityGroup];
    }
    return [mutalbeArray copy];
}

-(NSMutableArray *)getFavoriteCitys{
    NSArray *favoriteCitys = [[NSUserDefaults standardUserDefaults] valueForKey:@"FAVORITE_CITY"];
    NSMutableArray *dataArr = [NSMutableArray arrayWithCapacity:0];
    for (NSString *city in favoriteCitys) {
        FavoriteCityModel *model = [[FavoriteCityModel alloc]init];
        model.name = city;
        [dataArr addObject:model];
    }
    return [dataArr mutableCopy];
}

-(void)saveFaoriteCityWith:(NSString *)city{
    NSArray *sourceArr = [[NSUserDefaults standardUserDefaults] valueForKey:@"FAVORITE_CITY"];
    NSMutableArray *favoriteCitys = [NSMutableArray arrayWithCapacity:0];
    if (sourceArr != nil){
        favoriteCitys = [NSMutableArray arrayWithArray:sourceArr];
    }
    for (NSString *cityName in favoriteCitys) {//判断是否有添加过收藏
        if ([cityName isEqualToString:city]) {
            return;
        }
    }
    
    [favoriteCitys addObject:city];
    [[NSUserDefaults standardUserDefaults] setValue:[favoriteCitys copy] forKey:@"FAVORITE_CITY"];
}

-(void)deleteFavoriteCityWith:(NSString *)city{
    NSArray *sourceArr = [[NSUserDefaults standardUserDefaults] valueForKey:@"FAVORITE_CITY"];
    NSMutableArray *favoriteCitys = [NSMutableArray arrayWithArray:sourceArr];
    [favoriteCitys removeObject:city];
    [[NSUserDefaults standardUserDefaults] setValue:[favoriteCitys copy] forKey:@"FAVORITE_CITY"];
}




@end
