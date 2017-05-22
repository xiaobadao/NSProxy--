//
//  UserLoginHttpHandler.m
//  NSProxy-用于网络接口
//
//  Created by apple on 2017/5/19.
//  Copyright © 2017年 Chuckie. All rights reserved.
//

#import "UserLoginHttpHandler.h"

@implementation UserLoginHttpHandler

- (void)getLoginInfo:(NSString *)token success:(void (^)(NSString *))success failture:(void (^)(NSString *))failture{
    NSLog(@"登录请求接口");
    token.length>0 ?success(@"success"):failture(@"failture");
}

- (void)getCodeInfo:(NSString *)token {
    NSLog(@"Code请求接口");
}

@end
