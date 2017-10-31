//
//  RFLocationManager.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/25.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "RFLocationManager.h"
@interface RFLocationManager()<CLLocationManagerDelegate>
@property (nonatomic,strong)CLLocationManager *manager;
//@property (nonatomic, copy) void(^saveLocationBlock)(double lat,double lon);
@property (nonatomic, copy) SaveLocationBlock saveLocationBlock;
@property (nonatomic, copy) SaveCityBlock saveCityBlock;
@end

@implementation RFLocationManager
-(instancetype)init{
    if (self = [super init]) {
        self.manager = [CLLocationManager new];
        [self.manager requestWhenInUseAuthorization];
        self.manager.delegate = self;
    }
    return self;
}

+(RFLocationManager *)sharedInstance{
    static RFLocationManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

+ (void)getUserLocation:(void(^)(double lat,double lon))locationBlock{
    [[RFLocationManager sharedInstance] getUserLocations:locationBlock];
}

+ (void)getUserCity:(void(^)(NSString *city))cityBlock{
    [[RFLocationManager sharedInstance] getUserCitys:cityBlock];
}

- (void)getUserLocations:(void(^)(double lat,double lon))locationBlock{
    if (![CLLocationManager locationServicesEnabled]) {
        [SVProgressHUD showErrorWithStatus:@"未开启定位功能，请先打开定位功能!"];
        return;
    }
    
    self.saveLocationBlock = [locationBlock copy];
    
    self.manager.distanceFilter = 500;//定位精度
    
    [self.manager startUpdatingLocation];
}

-(void)getUserCitys:(void(^)(NSString *city))cityBlock{
    if (![CLLocationManager locationServicesEnabled]) {
        [SVProgressHUD showErrorWithStatus:@"未开启定位功能，请先打开定位功能!"];
        return;
    }
    
    self.saveCityBlock  = [cityBlock copy];
    
    self.manager.distanceFilter = 500;//定位精度
    
    [self.manager startUpdatingLocation];
}

#pragma mark CLLocationManagerDelegate
//定位成功
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    //防止调用多次
    CLLocation *location = [locations lastObject];
    
    //block传参
//    self.saveLocationBlock(location.coordinate.latitude,location.coordinate.longitude);
    
    //返地理编码
    CLGeocoder *geoCoder = [[CLGeocoder alloc]init];
    [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count > 0) {
            CLPlacemark *placeMark = placemarks[0];
            self.currentCity = placeMark.locality;
            self.currentDetailAddress = placeMark.subLocality;
            if (!self.currentCity) {
                [SVProgressHUD showErrorWithStatus:@"定位功能好像出了点问题，无法定位当前城市，请稍后再试!"];
                return ;
            }
            //block传参
            self.saveCityBlock(self.currentCity);
            [self.manager stopUpdatingLocation];
            
        }else if (error == nil && placemarks.count == 0) {
            [SVProgressHUD showErrorWithStatus:@"No location and error return"];
        }
        else if (error) {
            NSString *errorString = [NSString stringWithFormat:@"定位失败:%@",error];
            [SVProgressHUD showErrorWithStatus:errorString];
        }
        
    }];
    
}

//定位失败
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSString *errorString = [NSString stringWithFormat:@"定位失败：%@",error];
    [SVProgressHUD showErrorWithStatus:errorString];
//    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"允许\"定位\"提示" message:@"请在设置中打开定位" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"打开定位" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        //打开定位设置
//        NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
//        [[UIApplication sharedApplication] openURL:settingsURL
//                                           options:nil completionHandler:nil];
//    }];
//    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//
//    }];
//    [alertVC addAction:cancel];
//    [alertVC addAction:ok];
//    [self. presentViewController:alertVC animated:YES completion:nil];
}

@end
