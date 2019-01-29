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

#import "NSString+Valid.h"

@implementation NSString (Valid)

#pragma mark - public
- (BOOL)isChinese
{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

- (NSString *)ease_noEmojiText
{
    NSString *pattern = @"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]";
    return [self ease_textPregReplace:pattern template:@""];
}

- (BOOL)ease_isBlank
{
    if (!self) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (!self.length) {
        return YES;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [self stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {
        return YES;
    }
    return NO;
}

#pragma mark - private
- (NSString *)ease_textPregReplace:(NSString *)pattern template:(NSString *)template
{
    if (!self || !self.length || [self isKindOfClass:[NSNull class]]) {
        return @"";
    }
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern
                                                                      options:NSRegularExpressionCaseInsensitive
                                                                        error:nil];
    return [regex stringByReplacingMatchesInString:self options:NSRegularExpressionCaseInsensitive range:NSMakeRange(0, self.length) withTemplate:template];
}

@end
