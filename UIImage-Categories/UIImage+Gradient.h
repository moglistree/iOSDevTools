//
//  UIImage+Gradient.h
//  Alexi
//
//  Created by Martin on 9/9/15.
//  Copyright (c) 2015 Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Gradient)

- (UIImage *) imageWithGradient:(NSArray*)colors;

- (UIImage *) applyGradientColors:(NSArray *) gradientColors
                     andBlendMode:(CGBlendMode) blendMode
                         forFrame:(CGRect) frame;

@end
