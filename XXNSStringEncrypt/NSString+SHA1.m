//
//  NSString+SHA1.m
//  gcd
//
//  Created by 王恒 on 2020/5/7.
//  Copyright © 2020 wheng. All rights reserved.
//

#import "NSString+SHA1.h"

@implementation NSString (SHA1)

- (NSString *)SHA1 {
    if (!self) { return nil; }
    
    NSData* data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    
    NSMutableString *res = [[NSMutableString alloc] initWithCapacity:CC_SHA1_DIGEST_LENGTH];
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [res appendFormat:@"%02x", digest[i]];
    }
    return res;
}

@end
