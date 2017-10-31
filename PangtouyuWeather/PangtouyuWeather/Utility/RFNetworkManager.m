//
//  RFNetworkManager.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/25.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "RFNetworkManager.h"
#import "ReturnInfo.h"

@implementation RFNetworkManager
+(RFNetworkManager *)sharedInstance{
    static RFNetworkManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

-(void)requestDataWith:(NSString *)cityName{
//    return;
    //添加网络加载指示
    UIApplication *application = [UIApplication sharedApplication];
    application.networkActivityIndicatorVisible = YES;
    
    NSString *appcode = @"f77078ce923c4d8eaa9c11455a0d05ac";
    NSString *host = @"http://jisutianqi.market.alicloudapi.com";
    NSString *path = @"/weather/query";
    NSString *method = @"GET";
//    NSString *querys = @"?city=%E5%AE%89%E9%A1%BA&citycode=citycode&cityid=cityid&ip=ip&location=location";
    NSString *queryCityEncodeString = [cityName stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];//string编码Encoding
    NSString *querys = [NSString stringWithFormat:@"?city=%@&citycode=citycode&cityid=cityid&ip=ip&location=location",queryCityEncodeString];

    NSString *url = [NSString stringWithFormat:@"%@%@%@",  host,  path,  querys];
//    NSString *bodys = @"";
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  5];
    request.HTTPMethod  =  method;
    [request addValue:  [NSString  stringWithFormat:@"APPCODE %@" ,  appcode]  forHTTPHeaderField:  @"Authorization"];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable body , NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            application.networkActivityIndicatorVisible = NO;
        });
        
       NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
       NSDictionary *responeDic = httpResponse.allHeaderFields;
       id errorMsg = responeDic[@"X-Ca-Error-Message"];
       
       if (httpResponse.statusCode != 200) {
           [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"StatusCode:%ld\n%@",httpResponse.statusCode,errorMsg]];
           return ;
       }else{
           ReturnInfo *returnInfo =[ReturnInfo yy_modelWithJSON:body];
           
           NSString *bodyString = [[NSString alloc] initWithData:body encoding:NSUTF8StringEncoding];
           //打印应答中的body
           NSLog(@"Response body: %@" , bodyString);
           
           if (self.delegate && [self.delegate respondsToSelector:@selector(callBackWithResult:)]) {
               [self.delegate callBackWithResult:returnInfo.result];
           }
       }
     }];
    
    [task resume];
}

-(void)requestData1{
    NSString *appcode = @"f77078ce923c4d8eaa9c11455a0d05ac";
    NSString *host = @"http://jisutianqi.market.alicloudapi.com";
    NSString *path = @"/weather/city";
    NSString *method = @"GET";
    NSString *querys = @"";
    NSString *url = [NSString stringWithFormat:@"%@%@%@",  host,  path , querys];
    __unused NSString *bodys = @"";
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  5];
    request.HTTPMethod  =  method;
    [request addValue:  [NSString  stringWithFormat:@"APPCODE %@" ,  appcode]  forHTTPHeaderField:  @"Authorization"];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request
                                                   completionHandler:^(NSData * _Nullable body , NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                       NSLog(@"Response object: %@" , response);
                                                       NSString *bodyString = [[NSString alloc] initWithData:body encoding:NSUTF8StringEncoding];
                                                       
                                                       //打印应答中的body
                                                       NSLog(@"Response body: %@" , bodyString);
                                                   }];
    
    [task resume];
}








@end
