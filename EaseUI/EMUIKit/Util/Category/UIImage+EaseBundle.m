//
//  UIImage+EaseBundle.m
//  EaseUI
//
//  Created by apple on 2019/1/15.
//

#import "NSBundle+EaseUI.h"
#import "UIImage+EaseBundle.h"

@implementation UIImage (EaseBundle)

+ (UIImage *)ease_imageNamedFromMyBundle:(NSString *)name {
    NSBundle *imageBundle = [NSBundle ease_bundle];
    name = [name stringByAppendingString:@"@2x"];
    NSString *imagePath = [imageBundle pathForResource:name ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    if (!image) {
        name = [name stringByReplacingOccurrencesOfString:@"@2x" withString:@""];
        image = [UIImage imageNamed:name];
    }
    return image;
}

@end
