//
//  NSString+SHA1.h
//  gcd
//
//  Created by 王恒 on 2020/5/7.
//  Copyright © 2020 wheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SHA1)

- (NSString *)SHA1;

@end

NS_ASSUME_NONNULL_END
