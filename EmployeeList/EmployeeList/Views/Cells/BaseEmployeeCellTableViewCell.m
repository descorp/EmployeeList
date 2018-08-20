//
//  BaseEmployeeCellTableViewCell.m
//  EmployeeList
//
//  Created by Vladimir Abramichev on 19/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import "UITableViewCell+Identifier.h"
#import "BaseEmployeeCellTableViewCell.h"
#import "BaseEmployeeCellTableViewCell+Internal.h"
#import "Employee+Currency.h"

@interface BaseEmployeeCellTableViewCell ()

@property (nonatomic, readwrite) UILabel *nameLable;
@property (nonatomic, readwrite) UILabel *birthYearLable;
@property (nonatomic, readwrite) UILabel *salaryLable;

- (void)setup;

@end

@implementation BaseEmployeeCellTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier: reuseIdentifier];
    if (self) {
        self.nameLable = [[UILabel new] initWithFrame:CGRectZero];
        [self.nameLable setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:self.nameLable];
        
        self.salaryLable = [[UILabel new] initWithFrame:CGRectZero];
        [self.salaryLable setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:self.salaryLable];
        
        self.birthYearLable = [[UILabel new] initWithFrame:CGRectZero];
        [self.birthYearLable setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:self.birthYearLable];
        
        [self setup];
    }
    return self;
}

- (void)updateWithEmployee:(Employee*)value {
    self.nameLable.text = value.name;
    self.birthYearLable.text = [NSString stringWithFormat:@"%@",  @(value.birthYear)];
    self.salaryLable.text = value.salaryString;
}

- (void)setup { }

@end
