//
//  UITableViewCell+Register.m
//  EmployeeList
//
//  Created by Vladimir Abramichev on 20/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import "UITableViewCell+Identifier.h"

@implementation UITableViewCell (Identifier)

/// Get an identifier for the cell based on it's class name.
+ (NSString * _Nonnull)defaultCellIdentifier {
    NSString *identifier = NSStringFromClass(self.class);
    return identifier;
}

@end
