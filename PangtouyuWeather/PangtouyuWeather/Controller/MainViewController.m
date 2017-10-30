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

#import "RFNetworkManager.h"

@interface MainViewController ()<RFNetworkManagerDelegate>
@property(nonatomic,strong) MainView *mainView;
@property(nonatomic,strong) Result *weatherResult;
@property(nonatomic,strong) RFNetworkManager *network;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self setUpUI];
    
//     [self.network requestData];
    
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
    self.view = self.mainView;    
}

-(void)presentFavoriteVC:(UIButton *)btn{
    FavoriteCitysViewController *vc = [[FavoriteCitysViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
