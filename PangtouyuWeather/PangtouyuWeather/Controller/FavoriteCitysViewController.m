//
//  FavoriteCitysViewController.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/27.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "FavoriteCitysViewController.h"
#import "CityChooseViewController.h"

#import "FavoriteCitysView.h"

@interface FavoriteCitysViewController ()<FavoriteCitysViewDelegate>
@property (nonatomic,strong)FavoriteCitysView *favoriteCitysView;

@end

@implementation FavoriteCitysViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUI];
}

-(void)setUpUI{
    self.favoriteCitysView = [[FavoriteCitysView alloc]initWithFrame:self.view.bounds];
    self.favoriteCitysView.deleagate =self;
    self.view = self.favoriteCitysView;
    
    BUTTON_TARGET(self.favoriteCitysView.tableFooterView.addCityBtn, addCity);
}

-(void)viewWillAppear:(BOOL)animated{
//    [self.favoriteCitysView getDataForDataArr];
    [self.favoriteCitysView.tableView reloadData];
}

-(void)addCity:(UIButton *)btn{
    CityChooseViewController *vc = [[CityChooseViewController alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:navi animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark FavoriteCitysViewDelegate
-(void)didSelectCell:(NSString *)city{
    if (self.delgate && [self.delgate respondsToSelector:@selector(selectCity:)]) {
        [self.delgate selectCity:city];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
