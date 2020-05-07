//
//  NSData+AES256.h
//  gcd
//
//  Created by 王恒 on 2020/5/7.
//  Copyright © 2020 wheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (AES256)

- (NSData *)AESEncrypt:(NSString *)key;

- (NSData *)AESDecrypt:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
