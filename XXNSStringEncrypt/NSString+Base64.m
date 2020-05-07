//
//  NSString+Base64.m
//  gcd
//
//  Created by 王恒 on 2020/5/7.
//  Copyright © 2020 wheng. All rights reserved.
//

#import "NSString+Base64.h"

@implementation NSString (Base64)

-(NSString *)Base64Encode {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSString *res = [data base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    return res;
}

- (NSString *)Base64Decode {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}

@end
