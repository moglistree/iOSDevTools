//
//  DefaultOverlayView.m
//  CollectiveIntegrations
//
//  Created by Martin Andonoski on 11/14/14.
//  
//

#import "DefaultOverlayView.h"

@interface DefaultOverlayView()

@property (nonatomic, strong) UIView *overlayView;
@property (nonatomic, strong) UIView *parentView;

@end

@implementation DefaultOverlayView

- (void) showInView:(UIView *)view{
    
    _parentView = view;
    
    if(self.bottomFrame) {
        self.frame = CGRectMake((self.parentView.frame.size.width - self.frame.size.width) / 2,
                                self.parentView.frame.origin.y + self.parentView.frame.size.height - self.frame.size.height,
                                self.frame.size.width,
                                self.frame.size.height);
    }
    else {
        self.frame = CGRectMake((self.parentView.frame.size.width - self.frame.size.width) / 2,
                                (self.parentView.frame.size.height - self.frame.size.height) / 2,
                                self.frame.size.width,
                                self.frame.size.height);
    }
    
    [self addOverlayToView:view];
    [view.window addSubview:self];

}

- (void) show{
    [self showInView:[UIApplication sharedApplication].keyWindow.rootViewController.view];
}

- (void)addOverlayToView:(UIView *) view {
    CGRect viewFrame = view.window.frame;
    
    _overlayView = [[UIView alloc] initWithFrame:viewFrame];
    _overlayView.alpha=0.6;
    
    if(self.whiteColor) {
        [_overlayView setBackgroundColor:[UIColor whiteColor]];
    }
    else {
        [_overlayView setBackgroundColor:[UIColor blackColor]];
    }
    
    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                      action:@selector(handleOverlayTap:)];
    [_overlayView addGestureRecognizer:singleFingerTap];
    
    [view.window addSubview:_overlayView];
}

- (void) hide{
    [_overlayView removeFromSuperview];
    [self removeFromSuperview];
}

- (void) hideAnimation{
    [self hide];
}

#pragma mark - UITapGestureRecognizer

- (void)handleOverlayTap:(UITapGestureRecognizer *)recognizer {
    [self hideAnimation];
}

@end
