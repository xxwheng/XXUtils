//
//  NSString+AES256.m
//  gcd
//
//  Created by 王恒 on 2020/5/7.
//  Copyright © 2020 wheng. All rights reserved.
//

#import "NSString+AES256.h"
#import "NSData+AES256.h"

@implementation NSString (AES256)

- (NSString *)AES256Encrypt:(NSString *)key {
//    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
//    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    // 兼容中文
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    //对数据进行加密
    NSData *result = [data AESEncrypt:key];
    //转换为2进制字符串
    if (result && result.length > 0) {
        Byte *datas = (Byte*)[result bytes];
        NSMutableString *output = [NSMutableString stringWithCapacity:result.length * 2];
           for(int i = 0; i < result.length; i++) {
               [output appendFormat:@"%02x", datas[i]];
           }
        return output;
    }
    return nil;
}

- (NSString *)AES256Decrypt:(NSString *)key {
    //转换为2进制Data
    NSMutableData *data = [NSMutableData dataWithCapacity:self.length / 2];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i < [self length] / 2; i++) {
        byte_chars[0] = [self characterAtIndex:i*2];
        byte_chars[1] = [self characterAtIndex:i*2+1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [data appendBytes:&whole_byte length:1];
    }
    //对数据进行解密
    NSData* result = [data AESDecrypt:key];
    if (result && result.length > 0) {
        return [[NSString  alloc] initWithData:result encoding:NSUTF8StringEncoding];
    }
    return nil;
}

@end
