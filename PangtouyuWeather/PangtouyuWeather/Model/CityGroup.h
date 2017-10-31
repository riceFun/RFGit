//
//  CityGroup.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/30.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityGroup : NSObject

//模型中的属性名称要和字典的key一模一样
@property (nonatomic,strong) NSArray *cities;
@property (nonatomic,strong) NSString *title;

@end
