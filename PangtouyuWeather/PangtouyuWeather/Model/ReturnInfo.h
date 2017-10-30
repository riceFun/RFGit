//
//  ReturnInfo.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/26.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Result.h"

@interface ReturnInfo : NSObject
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *msg;
@property (nonatomic,strong) Result *result;

@end
