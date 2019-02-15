//
//  NSBundle+EaseUI.h
//  EaseUI
//
//  Created by apple on 2019/1/14.
//

#import <Foundation/Foundation.h>

@interface NSBundle (EaseUI)

+ (NSBundle *)bundleWithBundleName:(NSString *)bundleName podName:(NSString *)podName;

+ (NSBundle *)ease_bundle;

+ (NSString *)ease_localizedStringForKey:(NSString *)key value:(NSString *)value;

+ (NSString *)ease_localizedStringForKey:(NSString *)key;

@end
