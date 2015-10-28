//
//  UILabel+textSize.m
//
//  Created by Martin on 4/3/15.
//  Copyright (c) 2015 Martin. All rights reserved.
//

#import "UILabel+textSize.h"

@implementation UILabel(textSize)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (CGRect) getSizeForText:(NSString *) text
                 forWidth:(CGFloat) width{
    
    CGSize desiredSize = CGSizeMake(width,
                                    INT16_MAX);
    
    return [text boundingRectWithSize:desiredSize
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{NSFontAttributeName:self.font}
                              context:nil];
    
}

- (CGRect) getSizeForText:(NSString *) text{
    CGSize desiredSize = CGSizeMake(self.frame.size.width,
                                    INT16_MAX);    
    
        return [text boundingRectWithSize:desiredSize
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{NSFontAttributeName:self.font}
                              context:nil];
}

@end
