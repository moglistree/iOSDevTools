//
//  DefaultOverlayView.h
//
//  Created by Martin Andonoski on 11/14/14.
//  
//

#import <UIKit/UIKit.h>

@interface DefaultOverlayView : UIView

@property BOOL whiteColor;
@property BOOL bottomFrame;

- (void) showInView:(UIView *)view;
- (void) hide;
//- (void) hideAnimation;
- (void) handleOverlayTap:(UITapGestureRecognizer *)recognizer;

@end
