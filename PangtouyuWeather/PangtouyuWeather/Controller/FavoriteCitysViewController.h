//
//  FavoriteCitysViewController.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/27.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FavoriteCitysViewControllerDelegate <NSObject>
-(void)selectCity:(NSString *)city;
@end

@interface FavoriteCitysViewController : UIViewController
@property (nonatomic,weak) id<FavoriteCitysViewControllerDelegate> delgate;

@end
