//
//  Aqi.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/26.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AqiInfo.h"

@interface Aqi : NSObject
@property (nonatomic,copy) NSString *so2;
@property (nonatomic,copy) NSString *so224;
@property (nonatomic,copy) NSString *no2;
@property (nonatomic,copy) NSString *no224;
@property (nonatomic,copy) NSString *co;
@property (nonatomic,copy) NSString *co24;
@property (nonatomic,copy) NSString *o3;
@property (nonatomic,copy) NSString *o38;
@property (nonatomic,copy) NSString *o324;
@property (nonatomic,copy) NSString *pm10;
@property (nonatomic,copy) NSString *pm1024;
@property (nonatomic,copy) NSString *pm2_5;
@property (nonatomic,copy) NSString *pm2_524;
@property (nonatomic,copy) NSString *iso2;
@property (nonatomic,copy) NSString *ino2;
@property (nonatomic,copy) NSString *ico;
@property (nonatomic,copy) NSString *io3;
@property (nonatomic,copy) NSString *io38;
@property (nonatomic,copy) NSString *ipm10;
@property (nonatomic,copy) NSString *ipm2_5;
@property (nonatomic,copy) NSString *aqi;
@property (nonatomic,copy) NSString *primarypollutant;
@property (nonatomic,copy) NSString *quality;
@property (nonatomic,copy) NSString *timepoint;
@property (nonatomic,strong) AqiInfo *aqiinfo;


@end
