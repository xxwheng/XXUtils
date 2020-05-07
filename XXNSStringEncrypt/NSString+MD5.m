//
//  NSString+MD5.m
//  gcd
//
//  Created by 王恒 on 2020/5/7.
//  Copyright © 2020 wheng. All rights reserved.
//

#import "NSString+MD5.h"

@implementation NSString (MD5)

- (NSString *)MD5 {
    NSString *str = [self MD5_32];
    if (str.length == 32) {
        return [str substringWithRange:NSMakeRange(8, 16)];
    } else {
        return nil;
    }
}


- (NSString *)MD5_32 {
    if (!self) {
        return nil;
    }
    const char* cStr = [self UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(cStr, (unsigned)strlen(cStr), result);
    
    NSMutableString *res = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [res appendFormat:@"%02x", result[i]];
    }
    return res;
    
}

@end
