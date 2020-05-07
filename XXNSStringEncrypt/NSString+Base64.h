//
//  NSString+Base64.h
//  gcd
//
//  Created by 王恒 on 2020/5/7.
//  Copyright © 2020 wheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Base64)

- (NSString *)Base64Encode;

- (NSString *)Base64Decode;

@end

NS_ASSUME_NONNULL_END
