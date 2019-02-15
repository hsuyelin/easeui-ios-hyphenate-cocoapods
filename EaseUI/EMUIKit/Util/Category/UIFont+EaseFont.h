//
//  UIFont+EaseFont.h
//
//  Created by hsuyelin on 2019/1/22.
//  Copyright © 2019年 hsuyelin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (EaseFont)

+ (UIFont *)ease_pingfangFontOfSize:(CGFloat)fontSize;

+ (UIFont *)ease_mediumPingfangFontOfSize:(CGFloat)fontSize;

+ (UIFont *)ease_boldPingfangFontOfSize:(CGFloat)fontSize;

+ (UIFont *)ease_pingfangFontOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight;

@end
