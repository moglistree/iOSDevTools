//
//  DefaultOverlayView.h
//  CollectiveIntegrations
//
//  Created by Martin Andonoski on 11/14/14.
//  
//

#import <UIKit/UIKit.h>
#import "BorderedView.h"

@interface DefaultOverlayView : BorderedView

@property BOOL whiteColor;
@property BOOL bottomFrame;

- (void) showInView:(UIView *)view;
- (void) hide;
//- (void) hideAnimation;
- (void) handleOverlayTap:(UITapGestureRecognizer *)recognizer;

@end
