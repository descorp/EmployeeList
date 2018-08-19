//
//  CustomEmployeeViewCell.m
//  EmployeeList
//
//  Created by Vladimir Abramichev on 19/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import "CustomEmployeeViewCell.h"
#import "BaseEmployeeCellTableViewCell+Internal.h"

@implementation CustomEmployeeViewCell

- (void)setup {
    
    NSDictionary *view = @{
                           @"name": self.nameLable,
                           @"birthYear": self.nameLable,
                           @"salary": self.nameLable,
                           };
    
    [self addConstraints:  [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(10)-[name]"
                                                                   options:0
                                                                   metrics:nil
                                                                     views:view]];
    [self addConstraints:  [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(10)-[birthYear]"
                                                                   options:0
                                                                   metrics:nil
                                                                     views:view]];
    [self addConstraints:  [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(5)-[name]-(10)-[birthYear]-(5)-|"
                                                                   options:0
                                                                   metrics:nil
                                                                     views:view]];
    [self addConstraints:  [NSLayoutConstraint constraintsWithVisualFormat:@"V:[salary]-(10)-|"
                                                                   options:0
                                                                   metrics:nil
                                                                     views:view]];
}

@end
