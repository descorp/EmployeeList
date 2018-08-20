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

- (void)updateWith:(NSArray<Employee*>*)collection;

- (void)nonBlockingSort;

@end
