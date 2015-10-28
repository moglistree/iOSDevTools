//
//  UITableView+cellForIdentifier.m
//
//  Copyright (c) 2015 Martin. All rights reserved.
//

#import "UITableView+cellForIdentifier.h"

@implementation UITableView (cellForIdentifier)

- (void) registerCellWithClass:(Class) cls{
    NSString *str = NSStringFromClass(cls);
    UINib *nibForRegistration = [UINib nibWithNibName:str
                                               bundle:nil];
    
    [self registerNib:nibForRegistration
forCellReuseIdentifier:str];
    
//    [self registerClass:cls
// forCellReuseIdentifier:NSStringFromClass(cls)];
    
}

- (UITableViewCell *) getCellFromClass:(Class) cls
                          forIndexPath:(NSIndexPath *) indexPath{
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(cls)
                                                       forIndexPath:indexPath];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(cls)
                                              owner:self
                                            options:nil] firstObject];
    }
    
    return cell;
}

@end
