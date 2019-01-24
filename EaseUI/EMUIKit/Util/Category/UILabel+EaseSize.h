//
//  UILabel+EaseSize.h
//  EaseUILite
//
//  Created by apple on 2019/1/18.
//

#import <UIKit/UIKit.h>

@interface UILabel (EaseSize)

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;
+ (CGFloat)getWidthByHeight:(CGFloat)height title:(NSString *)title font:(UIFont *)font;

@end
