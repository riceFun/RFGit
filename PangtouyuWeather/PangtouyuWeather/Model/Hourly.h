//
//  Hourly.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/26.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hourly : NSObject
@property (nonatomic,copy) NSString *time;
@property (nonatomic,copy) NSString *weather;
@property (nonatomic,copy) NSString *temp;
@property (nonatomic,copy) NSString *img;

@end
