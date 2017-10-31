//
//  MainViewController.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/20.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "MainViewController.h"
#import "FavoriteCitysViewController.h"

#import "MainView.h"

#import "RFLocationManager.h"
#import "RFNetworkManager.h"

@interface MainViewController ()<RFNetworkManagerDelegate,FavoriteCitysViewControllerDelegate>
@property(nonatomic,strong) MainView *mainView;
@property(nonatomic,strong) Result *weatherResult;
@property(nonatomic,strong) RFNetworkManager *network;
@property(nonatomic,copy) NSString *currentCity;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUI];
    
    [RFLocationManager getUserCity:^(NSString *city) {
        self.currentCity = city;
        [self.network requestDataWith:city];
    }];
 
}

-(RFNetworkManager *)network{
    if (!_network) {
        _network = [RFNetworkManager sharedInstance];
        _network.delegate = self;
    }
    return _network;
}

-(void)setUpUI{
    self.mainView = [[MainView alloc]initWithFrame:self.view.bounds];
    BUTTON_TARGET(self.mainView.toolBar.menuButton, presentFavoriteVC);
    BUTTON_TARGET(self.mainView.toolBar.dataSourceBtn, refreshData);
    self.view = self.mainView;    
}

-(void)presentFavoriteVC:(UIButton *)btn{
    FavoriteCitysViewController *vc = [[FavoriteCitysViewController alloc]init];
    vc.delgate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)refreshData:(UIButton *)btn{
    [self.network requestDataWith:self.currentCity];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark RFNetworkManagerDelegate
-(void)callBackWithResult:(Result *)result{
    self.weatherResult = result;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mainView reloadDataForViewWithData:result];
    });
    
}

#pragma mark FavoriteCitysViewControllerDelegate
-(void)selectCity:(NSString *)city{
    self.currentCity = city;
    [self.network requestDataWith:self.currentCity];
}


@end
