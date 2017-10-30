//
//  Result.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/26.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "Result.h"

@implementation Result
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"index" : [LifeIndex class],
             @"daily" : [Daily class],
             @"hourly" : [Hourly class]
            };
}


@end

