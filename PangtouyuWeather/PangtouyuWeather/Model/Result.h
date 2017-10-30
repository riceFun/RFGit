//
//  Result.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/26.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LifeIndex.h"
#import "Aqi.h"
#import "Daily.h"
#import "Hourly.h"

@interface Result : NSObject
@property (nonatomic,copy) NSString *city;
@property (nonatomic,copy) NSString *cityid;
@property (nonatomic,copy) NSString *citycode;
@property (nonatomic,copy) NSString *date;
@property (nonatomic,copy) NSString *week;
@property (nonatomic,copy) NSString *weather;
@property (nonatomic,copy) NSString *temp;
@property (nonatomic,copy) NSString *temphigh;
@property (nonatomic,copy) NSString *templow;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *humidity;
@property (nonatomic,copy) NSString *pressure;
@property (nonatomic,copy) NSString *windspeed;
@property (nonatomic,copy) NSString *winddirect;
@property (nonatomic,copy) NSString *windpower;
@property (nonatomic,copy) NSString *updatetime;
@property (nonatomic,strong) NSArray *index;
@property (nonatomic,strong) Aqi *aqi;
@property (nonatomic,strong) NSArray *daily;
@property (nonatomic,strong) NSArray *hourly;


@end
