//
//  UILabel+textSize.h
//
//  Created by Martin on 4/3/15.
//  Copyright (c) 2015 Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel(textSize)

- (CGRect) getSizeForText:(NSString *) text;
- (CGRect) getSizeForText:(NSString *) text
                 forWidth:(CGFloat) width;

@end
