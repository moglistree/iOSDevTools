//
//  leftCornerImageButton.h
//
//  Created by Martin on 3/31/15.
//  Copyright (c) 2015 Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "transparentBackgroundButton.h"

IB_DESIGNABLE
@interface leftCornerImageButton : transparentBackgroundButton

@property (nonatomic, strong)    IBInspectable UIImage *leftImage;
@property (nonatomic, readwrite) IBInspectable CGFloat topSpacing;
@property (nonatomic, readwrite) IBInspectable CGFloat leftSpacing;

@end
