//
//  WeexTabbarController.m
//  mecymapweex
//
//  Created by zhangshupeng on 2016/11/13.
//  Copyright © 2016年 sym. All rights reserved.
//

#import "WeexTabbarController.h"

@interface WeexTabbarController ()

@end

@implementation WeexTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void) setItems:(NSArray *)items {
    _items = items;
    NSMutableArray *barItemVCs = [NSMutableArray arrayWithCapacity:0];
    for (NSDictionary *item in self.items) {
        SPBaseViewController *vc = nil;
        
        UITabBarItem *barItem = [[UITabBarItem alloc] init];
        barItem.image = [UIImage imageNamed:[item objectForKey:@"img"]];
        barItem.selectedImage = [UIImage imageNamed:[item objectForKey:@"simg"]];
        barItem.title = [item objectForKey:@"title"];
        if ([[item objectForKey:@"jspath"] rangeOfString:@".js"].length > 0) {
            WeexViewController *wvc = [[WeexViewController alloc] init];
            NSString *path=[NSString stringWithFormat:@"file://%@/js/%@",[NSBundle mainBundle].bundlePath,[item objectForKey:@"jspath"]];
            wvc.jsPath = path;
            
            wvc.decreaseHeight = 108;
            vc = wvc;
        } else {
            vc = [[NSClassFromString([item objectForKey:@"jspath"]) alloc] init];
            
        }
        vc.tabBarItem = barItem;
        [barItemVCs addObject:vc];
    }
    self.viewControllers = barItemVCs;
    self.selectedIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
