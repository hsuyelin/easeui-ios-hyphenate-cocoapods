//
//  EaseTransparentBgLabel.m
//  EaseUILite
//
//  Created by apple on 2019/1/18.
//

#import "EaseTransparentBgLabel.h"

@implementation EaseTransparentBgLabel

- (instancetype)init {
    if (self = [super init]) {_textInsets = UIEdgeInsetsZero;}
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {_textInsets = UIEdgeInsetsZero;}
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _textInsets)];
}

@end
