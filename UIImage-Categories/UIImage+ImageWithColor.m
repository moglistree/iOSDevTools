//
//  UIImage+ImageWithColor.m
//  
//
//  Created by Ivan Pavlovic on 12/11/14.
//  Copyright (c) 2014 Spoiled Milk. All rights reserved.
//

#import "UIImage+ImageWithColor.h"

@implementation UIImage (ImageWithColor)

+ (UIImage *)imageWithColor:(UIColor *)color {
    return [self imageWithColor:color size:CGSizeMake(1,1)];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage *)resizableImageWithColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius {
    CGFloat minEdgeSize = cornerRadius * 2 + 1;
    CGRect rect = CGRectMake(0, 0, minEdgeSize, minEdgeSize);
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    roundedRect.lineWidth = 0;
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    [color setFill];
    [roundedRect fill];
    [roundedRect stroke];
    [roundedRect addClip];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(cornerRadius, cornerRadius, cornerRadius, cornerRadius)];
}

@end
