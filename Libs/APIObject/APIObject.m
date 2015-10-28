//
//  APIObject.m
//
//  Created by Martin on 10/4/15.
//  Copyright © 2015 Martin. All rights reserved.
//

#import "APIObject.h"

//default api object that can be extended for further need
@implementation APIObject

- (void)setValue:(id)value forKey:(NSString *)key {
    if (value == [NSNull null]) {
        return;
    }
    if ([[self valueForKey:key] isKindOfClass:[APIObject class]] &&
        [value isKindOfClass:[NSDictionary class]]) {
        [[self valueForKey:key] setValuesForKeysWithDictionary:value];
    } else {
        [super setValue:value forKey:key];
    }
}

@end
