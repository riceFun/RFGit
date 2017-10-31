//
//  FavoriteCityModel.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/31.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FavoriteCityModel : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *detailDescription;
@property (nonatomic,copy) NSString *refreshTime;
@property (nonatomic,copy) NSString *temp;
@end
