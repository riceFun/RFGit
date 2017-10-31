//
//  CityChooseViewController.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/30.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "CityChooseViewController.h"
#import "CityChooseView.h"
#import "RFDataManager.h"


@interface CityChooseViewController ()<CityChooseViewDelegate>
@property (nonatomic,strong)CityChooseView *cityChooseView;

@end

@implementation CityChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];


}

-(void)setUpUI{
    self.title = @"城市列表";
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(back) ];
    self.navigationItem.leftBarButtonItems = @[backItem];
    
    self.cityChooseView = [[CityChooseView alloc]initWithFrame:self.view.bounds];
    self.cityChooseView.delegate = self;
    self.view = self.cityChooseView;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark CityChooseViewDelegate
-(void)didSelectCity:(NSString *)city{
    RFLog(@"City:%@",city);
    
    [[RFDataManager sharedInstance] saveFaoriteCityWith:city];
    
    [self back];
}

-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
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
