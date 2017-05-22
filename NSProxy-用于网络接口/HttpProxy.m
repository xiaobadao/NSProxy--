//
//  HttpProxy.m
//  NSProxy-用于网络接口
//
//  Created by apple on 2017/5/19.
//  Copyright © 2017年 Chuckie. All rights reserved.
//

#import "HttpProxy.h"
#import <objc/objc-runtime.h>
@interface HttpProxy ()

@property (nonatomic,strong) NSMutableDictionary *selToHandlerMap;
@end
@implementation HttpProxy

+ (instancetype)shareHttpProxy {
    
    static HttpProxy *httpProxy = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpProxy = [self alloc];
        httpProxy.selToHandlerMap = [NSMutableDictionary dictionary];
    });
    return httpProxy;
}

- (void)registerHttpProtocol:(Protocol *)httpProtocol handler:(id)handler {
    unsigned int numberOfMethods = 0;
    struct objc_method_description *methods = protocol_copyMethodDescriptionList(httpProtocol, YES, YES, &numberOfMethods);
    for (unsigned int i = 0; i<numberOfMethods; i++) {
        struct objc_method_description method = methods[i];
        [_selToHandlerMap setValue:handler forKey:NSStringFromSelector(method.name)];
    }
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    NSString *methodName = NSStringFromSelector(invocation.selector);
    id handler = [_selToHandlerMap valueForKey:methodName];
    if (handler != nil && [handler respondsToSelector:invocation.selector]) {
        [invocation invokeWithTarget:handler];
    }else {
        [super forwardInvocation:invocation];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    NSString *methodName = NSStringFromSelector(sel);
    id handler = [_selToHandlerMap valueForKey:methodName];
    if (handler != nil && [handler respondsToSelector:sel]) {
        return [handler methodSignatureForSelector:sel];
    }else {
        return [super methodSignatureForSelector:sel];
    }
}

@end
