//
//  HttpProxy.h
//  NSProxy-用于网络接口
//
//  Created by apple on 2017/5/19.
//  Copyright © 2017年 Chuckie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginHttpHandler.h"
#import "RegesterHttpHandler.h"

@interface HttpProxy : NSProxy<LoginHttpHandler,RegesterHttpHandler>

+ (instancetype)shareHttpProxy;

- (void)registerHttpProtocol:(Protocol *)httpProtocol handler:(id)handler;

@end
