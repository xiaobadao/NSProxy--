//
//  RegesterHttpHandler.h
//  NSProxy-用于网络接口
//
//  Created by apple on 2017/5/19.
//  Copyright © 2017年 Chuckie. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RegesterHttpHandler <NSObject>

- (void)getRegesterInfo:(NSString *)info;
@end
