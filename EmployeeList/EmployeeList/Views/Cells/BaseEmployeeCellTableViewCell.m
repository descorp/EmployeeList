//
//  BaseEmployeeCellTableViewCell.m
//  EmployeeList
//
//  Created by Vladimir Abramichev on 19/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import "BaseEmployeeCellTableViewCell.h"
#import "BaseEmployeeCellTableViewCell+Internal.h"
#import "Employee+Currency.h"

@implementation BaseEmployeeCellTableViewCell

- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder {
    self.nameLable = [[UILabel new] init];
    self.salaryLable = [[UILabel new] init];
    self.birthYearLable = [[UILabel new] init];
    [self setup];
    return [super awakeAfterUsingCoder:aDecoder];
}

- (void)updateWithEmployee:(Employee*)value {
    self.nameLable.text = value.name;
    self.birthYearLable.text = [NSString stringWithFormat:@"%@",  @(value.birthYear)];
    self.salaryLable.text = value.salaryString;
}

- (void)setup { }

@end
