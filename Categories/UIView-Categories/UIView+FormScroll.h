//
//  UIView+FormScroll.h
//
//  Created by Martin on 3/30/15.
//  Copyright (c) 2015 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView(FormScroll)

-(void)scrollToY:(float)y;
-(void)scrollToView:(UIView *)view;
-(void)scrollElement:(UIView *)view toPoint:(float)y;

@end
