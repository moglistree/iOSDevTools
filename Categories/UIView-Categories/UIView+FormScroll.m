//
//  UIView+FormScroll.m
//
//  Created by Martin on 3/30/15.
//  Copyright (c) 2015 Martin. All rights reserved.
//

#import "UIView+FormScroll.h"

@implementation UIView(FormScroll)

- (void)scrollToY:(float)y
{
    
    [UIView beginAnimations:@"registerScroll" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.3];
    self.transform = CGAffineTransformMakeTranslation(0, y);
    [UIView commitAnimations];
    
}

- (void)scrollToView:(UIView *)view
{
    CGRect theFrame = view.frame;
    float y =  self.frame.size.height - (theFrame.origin.y - theFrame.size.height);
    [self scrollToY:-y];
}


- (void)scrollElement:(UIView *)view toPoint:(float)y
{
    CGRect theFrame = view.frame;
    float orig_y = theFrame.origin.y;
    float diff = y - orig_y;
    if (diff < 0) {
        [self scrollToY:diff];
    }
    else {
        [self scrollToY:0];
    }
    
}

@end
