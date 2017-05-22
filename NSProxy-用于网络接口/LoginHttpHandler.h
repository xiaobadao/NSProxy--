//
//  LoginHttpHandler.h
//  NSProxy-用于网络接口
//
//  Created by apple on 2017/5/19.
//  Copyright © 2017年 Chuckie. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoginHttpHandler <NSObject>

- (void)getLoginInfo:(NSString *)token success:(void(^)(NSString *))success failture:(void (^)(NSString *))failture;

- (void)getCodeInfo:(NSString *)token;

@end
