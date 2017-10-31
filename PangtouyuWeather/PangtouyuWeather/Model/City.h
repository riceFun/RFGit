//
//  City.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/30.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface City : UIView
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *cityId;
@property (nonatomic,copy) NSString *cityCode;
@property (nonatomic,strong) CLLocation *location;

@end
