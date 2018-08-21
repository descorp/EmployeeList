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
    return @{ @"name": self.nameLable, @"birthYear": self.birthYearLable, @"salary": self.salaryLable };
}

- (void)setup {
    for (UIView *subview in self.contentView.subviews) {
        subview.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    [self addVisualConstraints:@"H:|-[name]-[salary]-|"];
    [self addVisualConstraints:@"H:|-[birthYear(==name)]"];
    [self addVisualConstraints:@"V:|-[name][birthYear]-|"];
    [self.salaryLable.centerYAnchor  constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
    
    self.salaryLable.textAlignment = NSTextAlignmentRight;
    self.birthYearLable.font = [UIFont systemFontOfSize:15 weight:UIFontWeightThin];
    self.salaryLable.font = [UIFont systemFontOfSize:17 weight:UIFontWeightSemibold];
    //[self layoutIfNeeded];
}

- (void)addVisualConstraints:(NSString*)visualFormat {
    [self addConstraints:  [NSLayoutConstraint constraintsWithVisualFormat:visualFormat
                                                                   options:0
                                                                   metrics:nil
                                                                     views:self.views]];
}

@end
