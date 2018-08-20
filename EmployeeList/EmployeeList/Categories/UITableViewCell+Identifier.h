//
//  UITableViewCell+Register.h
//  EmployeeList
//
//  Created by Vladimir Abramichev on 20/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Identifier)

/// Get an identifier for the cell based on it's class name.
+ (NSString * _Nonnull)defaultCellIdentifier;

@end
