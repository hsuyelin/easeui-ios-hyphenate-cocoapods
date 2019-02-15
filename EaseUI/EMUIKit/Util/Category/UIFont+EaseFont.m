//
//  UIFont+EaseFont.m
//
//  Created by hsuyelin on 2019/1/22.
//  Copyright © 2019年 hsuyelin. All rights reserved.
//

#import "UIFont+EaseFont.h"

@implementation UIFont (EaseFont)

#pragma mark - public

+ (UIFont *)ease_pingfangFontOfSize:(CGFloat)fontSize {
    return [UIFont ease_pingfangFontOfSize:fontSize weight:UIFontWeightRegular];
}

+ (UIFont *)ease_mediumPingfangFontOfSize:(CGFloat)fontSize {
    return [UIFont ease_pingfangFontOfSize:fontSize weight:UIFontWeightMedium];
}

+ (UIFont *)ease_boldPingfangFontOfSize:(CGFloat)fontSize {
    return [UIFont ease_pingfangFontOfSize:fontSize weight:UIFontWeightSemibold];
}

+ (UIFont *)ease_pingfangFontOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight {
    NSString *fontName = [UIFont ease_pingfangFontNameOfWeight:weight];
    UIFont *aFont = [UIFont fontWithName:fontName size:fontSize];
    if ([UIFont ease_fontIsExist:fontName fontSize:fontSize]) {
        return aFont;
    } else {
        return [UIFont ease_defaultPingfangFontOfSize:fontSize weight:weight];
    }
}

#pragma mark - private

+ (BOOL)ease_fontIsExist:(NSString *)fontName fontSize:(CGFloat)fontSize {
    UIFont *aFont = [UIFont fontWithName:fontName size:fontSize];
    if (aFont && ([aFont.fontName compare:fontName] == NSOrderedSame ||
            [aFont.familyName compare:fontName] == NSOrderedSame)) {
        return YES;
    } else {
        return NO;
    }
}

+ (UIFont *)ease_defaultPingfangFontOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight {
    if (weight == UIFontWeightSemibold) {
        return [UIFont boldSystemFontOfSize:fontSize];
    } else {
        return [UIFont systemFontOfSize:fontSize];
    }
}

+ (NSString *)ease_pingfangFontNameOfWeight:(UIFontWeight)weight {
    if (weight == UIFontWeightMedium) {
        return @"PingFangSC-Medium";
    } else if (weight == UIFontWeightSemibold) {
        return @"PingFangSC-Semibold";
    } else if (weight == UIFontWeightLight) {
        return @"PingFangSC-Light";
    } else if (weight == UIFontWeightUltraLight) {
        return @"PingFangSC-Ultralight";
    } else if (weight == UIFontWeightRegular) {
        return @"PingFangSC-Regular";
    } else if (weight == UIFontWeightThin) {
        return @"PingFangSC-Thin";
    } else {
        return @"PingFangSC-Medium";
    }
}

@end
