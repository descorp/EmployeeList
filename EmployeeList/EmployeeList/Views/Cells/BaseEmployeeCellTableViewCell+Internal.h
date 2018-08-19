//
//  BaseEmployeeCellTableViewCell+Internal.h
//  EmployeeList
//
//  Created by Vladimir Abramichev on 20/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#ifndef BaseEmployeeCellTableViewCell_Internal_h
#define BaseEmployeeCellTableViewCell_Internal_h

@interface BaseEmployeeCellTableViewCell (Internal)

@property (nonatomic) UILabel *nameLable;
@property (nonatomic) UILabel *birthYearLable;
@property (nonatomic) UILabel *salaryLable;

- (void)setup;

@end

#endif /* BaseEmployeeCellTableViewCell_Internal_h */
