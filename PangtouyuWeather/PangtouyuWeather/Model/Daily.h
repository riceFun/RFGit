//
//  Daily.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/26.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Day.h"
#import "Night.h"

@interface Daily : NSObject
@property (nonatomic,copy) NSString *date;
@property (nonatomic,copy) NSString *week;
@property (nonatomic,copy) NSString *sunrise;
@property (nonatomic,copy) NSString *sunset;
@property (nonatomic,strong) Day *day;
@property (nonatomic,strong) Night *night;


@end
