//
//  UITableView+cellForIdentifier.h
//  testPanda
//
//  Created by Dimitar Delev on 7/28/15.
//  Copyright (c) 2015 Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (cellForIdentifier)

- (void) registerCellWithClass:(Class) cls;

- (UITableViewCell *) getCellFromClass:(Class) cls
                          forIndexPath:(NSIndexPath *) indexPath;

@end
