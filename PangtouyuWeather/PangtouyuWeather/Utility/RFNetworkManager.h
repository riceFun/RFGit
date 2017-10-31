//
//  RFNetworkManager.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/25.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Result.h"

@protocol RFNetworkManagerDelegate <NSObject>

-(void)callBackWithResult:(Result *)result;

@end

@interface RFNetworkManager : NSObject
@property (nonatomic,strong) Result *result;
@property (nonatomic,weak) id<RFNetworkManagerDelegate> delegate;

+(RFNetworkManager *)sharedInstance;

-(void)requestDataWith:(NSString *)cityName;

//-(void)requestDataCallBackBlock:(void (^)(Result *resultInfo))weathblock;

@end
