//
//  SelectedBorderColorTextField.h
//
//  Created by Martin on 8/12/15.
//  Copyright (c) 2015 Spoiled Milk. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface SelectedBorderColorTextField : UITextField

@property (nonatomic, strong) IBInspectable UIColor *selectedBorderColor;
@property (nonatomic, strong) IBInspectable UIColor *invalidBorderColor;

- (void) makeInvalid;
- (void) makeValid;

@end
