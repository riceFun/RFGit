//
//  RFDataManager.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/30.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityGroup.h"

@interface RFDataManager : NSObject

+(RFDataManager *)sharedInstance;

-(NSArray *)getCityGoupArr;

-(NSMutableArray *)getFavoriteCitys;
-(void)saveFaoriteCityWith:(NSString *)city;
-(void)deleteFavoriteCityWith:(NSString *)city;


@end
