//
//  SelectedBorderColorTextField.m
//
//  Created by Martin on 8/12/15.
//  Copyright (c) 2015 Spoiled Milk. All rights reserved.
//

#import "SelectedBorderColorTextField.h"

@implementation SelectedBorderColorTextField

- (BOOL)becomeFirstResponder{
    
    [self becomeActive];
    
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder{
    
    if ([self.text isEqualToString:@""]) {
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
    }
    
}

#pragma mark - public methods

- (void) makeInvalid{
    self.layer.borderWidth = 1.f;
    self.layer.borderColor = self.invalidBorderColor.CGColor;
}

- (void) makeValid{
    if ([self isFirstResponder]) {
        [self becomeActive];
    } else {
        [self becomeInactive];
    }
}

@end
