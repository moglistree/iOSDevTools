//
//  UIImage+fromColor.m
//  Alexi
//
//  Created by Martin on 10/27/15.
//  Copyright © 2015 Martin. All rights reserved.
//

#import "UIImage+fromColor.h"

@implementation UIImage (fromColor)

+ (UIImage *)imageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
