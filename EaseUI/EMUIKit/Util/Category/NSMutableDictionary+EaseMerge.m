//
//  NSMutableDictionary+EaseMerge.m
//  EaseUI
//
//  Created by apple on 2019/1/15.
//

#import "NSMutableDictionary+EaseMerge.h"

@implementation NSMutableDictionary (EaseMerge)

- (id)mutableDictionaryCopyIfNeeded:(id)dictObj {
    if ([dictObj isKindOfClass:[NSDictionary class]] &&
            ![dictObj isKindOfClass:[NSMutableDictionary class]]) {
        dictObj = [dictObj mutableCopy];
    }
    return dictObj;
}

/**
 合并两个字典

 @param dict 被合并的字典
 */
- (void)mergingWithDictionary:(NSDictionary *)dict {
    for (id key in [dict allKeys]) {
        id obj = [self mutableDictionaryCopyIfNeeded:[dict objectForKey:key]];
        id localObj = [self mutableDictionaryCopyIfNeeded:[self objectForKey:key]];
        if ([obj isKindOfClass:[NSDictionary class]] &&
                [localObj isKindOfClass:[NSMutableDictionary class]]) {
            // Recursive merge for NSDictionary
            [localObj mergingWithDictionary:obj];
        } else if (obj) {
            [self setObject:obj forKey:key];
        }
    }
}

/**
 合并两个字典

 @param dict       被合并的字典
 @param ignoredKey 忽略的Key
 */
- (void)mergingWithDictionary:(NSDictionary *)dict ignoredDictKey:(NSString *)ignoredKey {
    for (id key in [dict allKeys]) {
        if ([key isEqualToString:ignoredKey]) {continue;}
        id obj = [self mutableDictionaryCopyIfNeeded:[dict objectForKey:key]];
        id localObj = [self mutableDictionaryCopyIfNeeded:[self objectForKey:key]];
        if ([obj isKindOfClass:[NSDictionary class]] &&
                [localObj isKindOfClass:[NSMutableDictionary class]]) {
            // Recursive merge for NSDictionary
            [localObj mergingWithDictionary:obj];
        } else if (obj) {
            [self setObject:obj forKey:key];
        }
    }
}

@end
