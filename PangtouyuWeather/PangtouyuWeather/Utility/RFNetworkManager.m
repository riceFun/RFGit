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

-(void)requestData{
    NSString *appcode = @"f77078ce923c4d8eaa9c11455a0d05ac";
//    NSString *appcode = @"a9c11455a0d05ac";
    NSString *host = @"http://jisutianqi.market.alicloudapi.com";
    NSString *path = @"/weather/query";
    NSString *method = @"GET";
    NSString *querys = @"?city=%E5%AE%89%E9%A1%BA&citycode=111&cityid=cityid&ip=ip&location=location";
    NSString *url = [NSString stringWithFormat:@"%@%@%@",  host,  path , querys];
//    NSString *bodys = @"";
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  5];
    request.HTTPMethod  =  method;
    [request addValue:  [NSString  stringWithFormat:@"APPCODE %@" ,  appcode]  forHTTPHeaderField:  @"Authorization"];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable body , NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
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



@end
