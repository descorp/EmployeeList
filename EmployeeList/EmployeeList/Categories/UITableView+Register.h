//
//  UITableViewCell+Register.h
//  EmployeeList
//
//  Created by Vladimir Abramichev on 20/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Register)

- (void)registerCellClass:(Class)aClass;

- (UITableViewCell*)dequeueCell:(Class)aClass;

@end
