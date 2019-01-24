//
//  NSBundle+EaseUI.m
//  EaseUI
//
//  Created by apple on 2019/1/14.
//

#import "NSBundle+EaseUI.h"
#import "EaseMessageViewController.h"

@implementation NSBundle (EaseUI)

+ (NSBundle *)bundleWithBundleName:(NSString *)bundleName podName:(NSString *)podName
{
    if (bundleName == nil && podName == nil) {
        @throw @"bundleName和podName不能同时为空";
    } else if (bundleName == nil ) {
        bundleName = podName;
    } else if (podName == nil) {
        podName = bundleName;
    }
    if ([bundleName containsString:@".bundle"]) {
        bundleName = [bundleName componentsSeparatedByString:@".bundle"].firstObject;
    }
    // 没使用framwork的情况下
    NSURL *associateBundleURL = [[NSBundle mainBundle] URLForResource:bundleName withExtension:@"bundle"];
    // 使用framework形式
    if (!associateBundleURL) {
        associateBundleURL = [[NSBundle mainBundle] URLForResource:@"Frameworks" withExtension:nil];
        associateBundleURL = [associateBundleURL URLByAppendingPathComponent:podName];
        associateBundleURL = [associateBundleURL URLByAppendingPathExtension:@"framework"];
        NSBundle *associateBunle = [NSBundle bundleWithURL:associateBundleURL];
        associateBundleURL = [associateBunle URLForResource:bundleName withExtension:@"bundle"];
    }
    NSAssert(associateBundleURL, @"取不到关联bundle");
    // 生产环境直接返回空
    return associateBundleURL ? [NSBundle bundleWithURL:associateBundleURL] : nil;
}

+ (NSBundle *)ease_bundle
{
    return [NSBundle bundleWithBundleName:@"EaseUIResource" podName:@"EaseUILite"];
}

+ (NSString *)ease_localizedStringForKey:(NSString *)key {
    return [self ease_localizedStringForKey:key value:@""];
}

+ (NSString *)ease_localizedStringForKey:(NSString *)key value:(NSString *)value {
    NSBundle *languageBundle = [NSBundle bundleWithPath:[[NSBundle ease_bundle] pathForResource:@"zh-Hans" ofType:@"lproj"]];
    NSString *value1 = [languageBundle localizedStringForKey:key value:value table:nil];
    return value1;
}
@end
