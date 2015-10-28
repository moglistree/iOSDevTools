//
//  custemPlaceholderTextField.m
//  Alexi
//
//  Created by Martin on 3/31/15.
//  Copyright (c) 2015 Martin. All rights reserved.
//

#import "PlaceholderTextField.h"

#define PLACEHOLDER_COLOR [UIColor colorWithRed:0.718 green:0.714 blue:0.71 alpha:1] /*#b7b6b5*/

@interface PlaceholderTextField()

@property (nonatomic) IBInspectable UIColor *placeholderColor;
@property (nonatomic, strong) IBInspectable UIImage *clearImage;

@end

@implementation custemPlaceholderTextField


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    
    if ([self respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder
                                                                     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    }
    else{
        
        debugLog(@"Cannot set placeholder text's color, because deployment target is earlier than iOS 6.0");
        
    }
    
}

- (void)setClearImage:(UIImage *)clearImage{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:clearImage
            forState:UIControlStateNormal];
    
    [button setFrame:CGRectMake(0.0f, 0.0f, 15.0f, 15.0f)];
    
    [button addTarget:self
               action:@selector(clear:)
     forControlEvents:UIControlEventTouchUpInside];
    
    self.rightView = button;
    
    self.rightViewMode = UITextFieldViewModeWhileEditing;

    
}

-(IBAction)clear:(id)sender{
    self.text = @"";
}

@end
