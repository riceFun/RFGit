//
//  RFDefine.h
//  PangtouyuWeather
//
//  Created by riceFun on 2017/10/23.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#ifndef RFDefine_h
#define RFDefine_h

/**
 *Log日志打印
 */
#ifdef DEBUG
#define RFLog(...) NSLog(__VA_ARGS__)
#else
#define RFLog(...)
#endif

#define SCREEN_SIZE [[UIScreen mainScreen] bounds].size
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_WIDTH_SELF self.frame.size.width
#define SCREEN_HEIGHT_SELF self.frame.size.height
#define INDEX_CELL_HEIGHT 120

#define BUTTON_TARGET(button,selectorName) [button addTarget:self action:@selector(selectorName:) forControlEvents:UIControlEventTouchUpInside]
#define BUTTON_TARGET_DOWN(button,selectorName) [button addTarget:self action:@selector(selectorName:) forControlEvents:UIControlEventTouchDown]

#define UIIMAGE(imageName) [UIImage imageNamed:imageName]


#endif /* RFDefine_h */
