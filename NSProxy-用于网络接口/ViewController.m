//
//  ViewController.m
//  NSProxy-用于网络接口
//
//  Created by apple on 2017/5/19.
//  Copyright © 2017年 Chuckie. All rights reserved.
//

#import "ViewController.h"
#import "HttpProxy.h"
#import "UserLoginHttpHandler.h"
#import "UserRegesterHttpHandler.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[HttpProxy shareHttpProxy] registerHttpProtocol:@protocol(LoginHttpHandler) handler:[[UserLoginHttpHandler alloc] init]];
    [[HttpProxy shareHttpProxy] registerHttpProtocol:@protocol(RegesterHttpHandler) handler:[[UserRegesterHttpHandler alloc] init]];
    
    [[HttpProxy shareHttpProxy] getLoginInfo:@"123" success:^(NSString *str) {
        NSLog(@"%@",str);
    } failture:^(NSString *str) {
        NSLog(@"%@",str);
    }];
    [[HttpProxy shareHttpProxy] getLoginInfo:@"" success:^(NSString *str) {
        NSLog(@"%@",str);
    } failture:^(NSString *str) {
        NSLog(@"%@",str);
    }];
    
    [[HttpProxy shareHttpProxy] getRegesterInfo:@"are"];
    [[HttpProxy shareHttpProxy] getCodeInfo:@"code"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
