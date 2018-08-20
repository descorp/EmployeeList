//
//  ViewController.h
//  EmployeeList
//
//  Created by Vladimir Abramichev on 18/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeDirectory.h"

@interface EmployeeListViewController : UITableViewController

- (instancetype)initWithEmployeeDataSource:(NSObject<EmployeeDataProvider>*)dataSource;

@end

