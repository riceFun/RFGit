//
//  AqiInfo.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/26.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AqiInfo : NSObject
@property (nonatomic,copy) NSString *level;
@property (nonatomic,copy) NSString *color;
@property (nonatomic,copy) NSString *affect;
@property (nonatomic,copy) NSString *measure;

@end
