//
//  RFLocationManager.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/25.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void (^SaveLocationBlock)(double lat,double lon);
typedef void (^SaveCityBlock) (NSString *city);

@interface RFLocationManager : NSObject

@property (nonatomic,copy)NSString *currentCity;
@property (nonatomic,copy)NSString *currentDetailAddress;

+(RFLocationManager *)sharedInstance;

//用BLock获取地理经纬度
+ (void)getUserLocation:(void(^)(double lat,double lon))locationBlock;
+ (void)getUserCity:(void(^)(NSString *city))cityBlock;

@end
