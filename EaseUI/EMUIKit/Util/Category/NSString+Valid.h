/************************************************************
 *  * Hyphenate CONFIDENTIAL
 * __________________
 * Copyright (C) 2016 Hyphenate Inc. All rights reserved.
 *
 * NOTICE: All information contained herein is, and remains
 * the property of Hyphenate Inc.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Hyphenate Inc.
 */

#import <Foundation/Foundation.h>

@interface NSString (Valid)

/**
 是否为中文

 @return 是否为中文
 */
- (BOOL)isChinese;

/**
 是否为空

 @return 是否为空
 */
- (BOOL)ease_isBlank;

/**
 字符串去除emoji

 @return 不带emoji的字符串
 */
- (NSString *)ease_noEmojiText;

@end
