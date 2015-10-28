//
//  SelectedBorderColorTextView.h
//  Magasin
//
//  Created by Martin on 9/1/15.
//  Copyright (c) 2015 Spoiled Milk. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface SelectedBorderColorTextView : UITextView

@property (nonatomic, strong) IBInspectable UIColor *selectedBorderColor;
@property (nonatomic, strong) IBInspectable UIColor *invalidBorderColor;
@property (nonatomic, readwrite) IBInspectable BOOL validate;

- (void) makeInvalid;
- (void) makeValid;

@end
