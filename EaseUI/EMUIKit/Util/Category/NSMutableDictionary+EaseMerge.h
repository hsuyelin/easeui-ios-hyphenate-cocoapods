//
//  NSMutableDictionary+EaseMerge.h
//  EaseUI
//
//  Created by apple on 2019/1/15.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (EaseMerge)

- (void)mergingWithDictionary:(NSDictionary *)dict;
- (void)mergingWithDictionary:(NSDictionary *)dict ignoredDictKey:(NSString *)ignoredKey;

@end
