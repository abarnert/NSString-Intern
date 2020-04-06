//
//  NSString+Intern.m
//  interny
//
//  Created by Andrew Barnert on 4/6/20.
//  Copyright © 2020 Andrew Barnert. All rights reserved.
//

#import "NSString+Intern.h"
#import <Foundation/Foundation.h>

@interface NSString (Intern_private)
@property (class, nonatomic, readonly) NSMutableSet<NSString *> *strings;
@end

@implementation NSString (Intern_private)
static NSMutableSet *_strings = nil;
+ (NSMutableSet *)strings {
    if (!_strings) {
        _strings = [[NSMutableSet alloc] init];
    }
    return _strings;
}
@end

@implementation NSString (Intern)
- (NSString *)intern {
    @synchronized (self.class) {
        NSString *interned = [self.class.strings member:self];
        if (interned)
            return interned;
        [self.class.strings addObject:self];
        return self;
    }
}
@end
