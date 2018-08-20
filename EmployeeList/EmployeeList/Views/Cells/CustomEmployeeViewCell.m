//
//  CustomEmployeeViewCell.m
//  EmployeeList
//
//  Created by Vladimir Abramichev on 19/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import "CustomEmployeeViewCell.h"
#import "BaseEmployeeCellTableViewCell+Internal.h"

@interface CustomEmployeeViewCell ()

@property (nonatomic) NSDictionary *view;

@end

@implementation CustomEmployeeViewCell

-(NSDictionary *)views {
    return @{ @"name": self.nameLable, @"birthYear": self.nameLable, @"salary": self.nameLable };
}

- (void)setup {
    [self addVisualConstraints:@"V:|-(10)-[name]"];
    [self addVisualConstraints:@"V:|-(10)-[birthYear]"];
    [self addVisualConstraints:@"H:|-(5)-[name]-(10)-[birthYear]-(5)"];
    [self addVisualConstraints:@"V:[salary]-(10)-|"];
}

- (void)addVisualConstraints:(NSString*)visualFormat {
    [self addConstraints:  [NSLayoutConstraint constraintsWithVisualFormat:visualFormat
                                                                   options:0
                                                                   metrics:nil
                                                                     views:self.views]];
}

@end
