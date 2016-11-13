//
//  WeexViewController.h
//  mecymapweex
//
//  Created by zhangshupeng on 2016/11/13.
//  Copyright © 2016年 sym. All rights reserved.
//

#import "SPBaseViewController.h"

@interface WeexViewController : SPBaseViewController


/**
 view height ;default 64
 */
@property (nonatomic, assign) CGFloat decreaseHeight;

/**
 js file path
 */
@property (nonatomic, copy) NSString *jsPath;

@end
