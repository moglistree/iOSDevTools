//
//  UIImage+ImageWithColor.h
//  
//
//  Created by Ivan Pavlovic on 12/11/14.
//  Copyright (c) 2014 Spoiled Milk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageWithColor)

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)resizableImageWithColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius;

@end
