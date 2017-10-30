//
//  FavoriteCitysViewController.m
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/27.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "FavoriteCitysViewController.h"
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark FavoriteCitysViewDelegate
-(void)didSelectCell:(NSIndexPath *)indexPath{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
