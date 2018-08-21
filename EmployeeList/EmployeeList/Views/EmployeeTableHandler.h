//
//  EmployeeListViewController+TableDataSource.h
//  EmployeeList
//
//  Created by Vladimir Abramichev on 20/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import "EmployeeListViewController.h"
#import "Employee.h"

@interface EmployeeTableHandler: NSObject<UITableViewDataSource, UITableViewDelegate>

- (instancetype)initWithTable:(UITableView*)tableView;

- (void)updateWith:(NSArray<Employee*>*)collection;

- (void)nonBlockingSortWith:(NSComparisonResult (^)(id  _Nonnull __strong, id  _Nonnull __strong))comparator;

@end
