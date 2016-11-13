//
//  WeexViewController.m
//  mecymapweex
//
//  Created by zhangshupeng on 2016/11/13.
//  Copyright © 2016年 sym. All rights reserved.
//

#import "WeexViewController.h"
#import <WeexSDK/WXSDKInstance.h>
@interface WeexViewController ()
{
    NSURL *_jsURL;
    
}
@property (nonatomic, strong) WXSDKInstance *instance;
@property (nonatomic, strong) UIView *weexView;

@end

@implementation WeexViewController

- (instancetype)init {
    if (self = [super init]) {
        self.decreaseHeight = 64;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _jsURL = [NSURL URLWithString:self.jsPath];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    _instance.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - self.decreaseHeight);
    __weak typeof(self) weakSelf = self;
    _instance.onCreate = ^(UIView *view) {
        [weakSelf.weexView removeFromSuperview];
        weakSelf.weexView = view;
        [weakSelf.view addSubview:weakSelf.weexView];
    };
    _instance.onFailed = ^(NSError *error) {
        NSLog(@"加载错误");
    };
    
    _instance.renderFinish = ^ (UIView *view) {
        NSLog(@"加载完成");
    };
    if (!_jsURL) {
        return;
    }
    [_instance renderWithURL: _jsURL];
    self.view.backgroundColor=[UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    [_instance destroyInstance];
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
