//
//  NSString+Intern.h
//  interny
//
//  Created by Andrew Barnert on 4/6/20.
//  Copyright © 2020 Andrew Barnert. All rights reserved.
//

#import <Foundation/NSString.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Intern)
- (NSString *)intern;
@end

NS_ASSUME_NONNULL_END
