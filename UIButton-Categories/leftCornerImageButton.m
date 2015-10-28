//
//  leftCornerImageButton.m
//
//  Created by Martin on 3/31/15.
//  Copyright (c) 2015 Martin. All rights reserved.
//

#import "leftCornerImageButton.h"

#define LEFT_SPACING 12.0f

@interface leftCornerImageButton()

@end

@implementation leftCornerImageButton

- (void)setLeftSpacing:(CGFloat)leftSpacing{
    
    _leftSpacing = leftSpacing;
    
    self.leftImage = self.leftImage;
    
}

- (void)setTopSpacing:(CGFloat)topSpacing{
    
    _topSpacing = topSpacing;
    
    self.leftImage = self.leftImage;
    
}

- (void)removeLeftImageTemprary{
    
    [self setLeftImage:nil forState:UIControlStateNormal];
    [self setLeftImage:nil forState:UIControlStateSelected];
    [self setLeftImage:nil forState:UIControlStateHighlighted];
    
}

- (void)setLeftImage:(UIImage *)leftImage{
    
    _leftImage = leftImage;
    
    [self setLeftImage:leftImage forState:UIControlStateNormal];
    [self setLeftImage:leftImage forState:UIControlStateSelected];
    [self setLeftImage:leftImage forState:UIControlStateHighlighted];
    
}

- (void)setLeftImage:(UIImage *)image
            forState:(UIControlState)state
{
    
    UIView *colorView = [[UIView alloc] initWithFrame:self.frame];
    colorView.backgroundColor = [UIColor clearColor];
    
    if (image != nil) {
        
        CGFloat imageWidth = image.size.width;
        CGFloat imageHeight = image.size.height;
        CGFloat buttonHeight = self.frame.size.height - 2 * self.topSpacing;
        CGFloat coeficient = buttonHeight / imageHeight;
        
        CGFloat scaledWidth = imageWidth * coeficient;
        CGFloat scaledHeight = imageHeight * coeficient;
        
        UIImageView *leftImageView = [[UIImageView alloc] initWithImage:image];
        if (self.leftSpacing == 0) {
            self.leftSpacing = LEFT_SPACING;
        }
        leftImageView.frame = CGRectMake(self.leftSpacing,
                                     self.topSpacing,
                                     scaledWidth,
                                     scaledHeight);
        
        leftImageView.contentMode = UIViewContentModeScaleAspectFit;
        [colorView addSubview:leftImageView];
    }
    
    UIGraphicsBeginImageContextWithOptions(colorView.bounds.size, NO, [UIScreen mainScreen].scale);
    [colorView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *colorImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self setBackgroundImage:colorImage
                    forState:state];
    
    self.clipsToBounds = YES;
    self.autoresizesSubviews = YES;
}

- (void)addLoader{

    [self removeLeftImageTemprary];
    
    [super addLoader];
    
}

- (void)removeLoader{
    
    [self setLeftImage:self.leftImage];
    
    [super removeLoader];
    
}


@end
