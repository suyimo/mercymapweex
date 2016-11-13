//
//  WeexTabbarController.h
//  mecymapweex
//
//  Created by zhangshupeng on 2016/11/13.
//  Copyright © 2016年 sym. All rights reserved.
//

#import "SPTabbarController.h"
#import "WeexViewController.h"
@interface WeexTabbarController : SPTabbarController


/**
 {
    jspath:path, //js 文件路径
    img:img,     //图片
    simg:simg,   //选中的图片
    title:title, //标题
    
 }
 */
@property (nonatomic, strong) NSArray *items;

@end
