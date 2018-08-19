//
//  BaseEmployeeCellTableViewCell.h
//  EmployeeList
//
//  Created by Vladimir Abramichev on 19/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"

@interface BaseEmployeeCellTableViewCell : UITableViewCell

- (void)updateWithEmployee:(Employee*)value;

@end
