//
//  UIImage+Gradient.m
//  Alexi
//
//  Created by Martin on 9/9/15.
//  Copyright (c) 2015 Martin. All rights reserved.
//

#import "UIImage+Gradient.h"

@implementation UIImage (Gradient)

- (UIImage *) imageWithGradient:(NSArray*)colors
{
    // Load image
    UIImage *image = self;
    CGFloat scale = image.scale;
    UIGraphicsBeginImageContextWithOptions(self.size, YES, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, image.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextSetBlendMode(context, kCGBlendModeMultiply);
    CGRect rect = CGRectMake(0, 0, image.size.width * scale, image.size.height * scale);
    CGContextDrawImage(context, rect, image.CGImage);
    
    NSMutableArray *cgColors = [NSMutableArray arrayWithCapacity:colors.count];
    for (UIColor *color in colors)
        [cgColors addObject:(id)color.CGColor];
    
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CFArrayRef arrRef = (__bridge CFArrayRef)cgColors;
    CGGradientRef gradient = CGGradientCreateWithColors(space, arrRef, NULL);
    
    // Apply gradient
    CGContextClipToMask(context, rect, image.CGImage);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0,0), CGPointMake(0,image.size.height * scale), 0);
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    CGGradientRelease(gradient);
    CGColorSpaceRelease(space);
    
    return gradientImage;
}

- (UIImage *) applyGradientColors:(NSArray *) gradientColors
                     andBlendMode:(CGBlendMode) blendMode
                         forFrame:(CGRect) frame{
    UIGraphicsBeginImageContextWithOptions(frame.size, YES, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, frame.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0,
                             0,
                             frame.size.width,
                             frame.size.height);
    CGContextDrawImage(context, rect, self.CGImage);
    // Create gradient
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    NSMutableArray *cgColors = [NSMutableArray arrayWithCapacity:gradientColors.count];
    for (UIColor *color in gradientColors)
        [cgColors addObject:(id)color.CGColor];
    CFArrayRef arrRef = (__bridge CFArrayRef)cgColors;
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, arrRef, nil);
    // Apply gradient
    CGContextClipToMask(context, rect, self.CGImage);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0, frame.size.height), 0);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    return image;

}

@end
