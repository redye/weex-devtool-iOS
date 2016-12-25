/**
 * Created by Weex.
 * Copyright (c) 2016, Alibaba, Inc. All rights reserved.
 *
 * This source code is licensed under the Apache Licence 2.0.
 * For the full copyright and license information,please view the LICENSE file in the root directory of this source tree.
 */

#import "WXDebugDomain.h"

@implementation WXDebugDomain

@dynamic delegate;

+ (NSString *)domainName {
    return @"WxDebug";
}

#pragma mark - Public Method
- (void)handleMethodWithName:(NSString *)methodName parameters:(NSDictionary *)params responseCallback:(WXResponseCallback)responseCallback {
    if ([methodName isEqualToString:@"enable"] && [self.delegate respondsToSelector:@selector(domain:enableWithCallback:)]) {
        [self.delegate domain:self enableWithCallback:^(id error) {
            responseCallback(nil, error);
        }];
    } else if ([methodName isEqualToString:@"setLogLevel"] && [self.delegate respondsToSelector:@selector(domain:sendLogLevel:withCallback:)]) {
        [self.delegate domain:self sendLogLevel:[params objectForKey:@"logLevel"] withCallback:^(id error) {
            responseCallback(nil,error);
        }];
    } else if ([methodName isEqualToString:@"disable"] && [self.delegate respondsToSelector:@selector(domain:disableWithCallback:)]) {
        [self.delegate domain:self disableWithCallback:^(id error) {
            responseCallback(nil,error);
        }];
    } else if ([methodName isEqualToString:@"setElementMode"] && [self.delegate respondsToSelector:@selector(domain:setInspectorMode:withCallback:)]) {
        [self.delegate domain:self setInspectorMode:[params objectForKey:@"mode"] withCallback:^(id error) {
            responseCallback(nil,error);
        }];
    } else if ([methodName isEqualToString:@"refresh"] && [self.delegate respondsToSelector:@selector(domain:refreshCallback:)]) {
        [self.delegate domain:self refreshCallback:^(id error) {
            responseCallback(nil,error);
        }];
    } else if ([methodName isEqualToString:@"reload"] && [self.delegate respondsToSelector:@selector(domain:reloadCallback:)]) {
        [self.delegate domain:self reloadCallback:^(id error) {
            responseCallback(nil,error);
        }];
    } else if ([methodName isEqualToString:@"network"] && [self.delegate respondsToSelector:@selector(domain:enableNetwork:networkCallback:)]) {
        [self.delegate domain:self enableNetwork:[[params objectForKey:@"enable"] boolValue] networkCallback:^(id error) {
            responseCallback(nil,error);
        }];
    }
}



@end
