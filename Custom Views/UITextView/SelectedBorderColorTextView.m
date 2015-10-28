//
//  SelectedBorderColorTextView.m
//  Magasin
//
//  Created by Martin on 9/1/15.
//  Copyright (c) 2015 Spoiled Milk. All rights reserved.
//

#import "SelectedBorderColorTextView.h"

@implementation SelectedBorderColorTextView

- (void)drawRect:(CGRect)rect{
    self.layer.borderColor = [UIColor clearColor].CGColor;
}

- (BOOL)becomeFirstResponder{
    
    [self becomeActive];
    
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder{
    
    if ([self.text isEqualToString:@""] &&
        self.validate) {
        [self makeInvalid];
    } else {
        [self becomeInactive];
    }
    
    return [super resignFirstResponder];
}

- (void) becomeActive{
    if (self.selectedBorderColor) {
        self.layer.borderWidth = 1.f;
    }
    
    if (self.layer.borderColor != self.selectedBorderColor.CGColor) {
        self.layer.borderColor = self.selectedBorderColor.CGColor;
    }
}

- (void) becomeInactive{
    
    if (self.selectedBorderColor) {
        self.layer.borderWidth = 0.f;
        self.layer.borderColor = [UIColor clearColor].CGColor;
    }
    
}

#pragma mark - public methods

- (void) makeInvalid{
    if (self.validate) {
        self.layer.borderWidth = 1.f;
        self.layer.borderColor = self.invalidBorderColor.CGColor;
    }
}

- (void) makeValid{
    if ([self isFirstResponder]) {
        [self becomeActive];
    } else {
        [self becomeInactive];
    }
}

@end
