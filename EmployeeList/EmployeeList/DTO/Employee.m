//
//  Employee.m
//  EmployeeList
//
//  Created by Vladimir Abramichev on 18/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import "Employee.h"

static NSUInteger const kStartingSalary = 10000;
NSString* const kSalaryCurrency = @"EUR";

@implementation Employee

- (instancetype)initWithName:(NSString*)name birthYear:(NSUInteger)birthYear {
    self = [super init];
    if(self) {
        _name = name;
        _birthYear = birthYear;
        _salary = [[NSDecimalNumber alloc] initWithUnsignedInteger:kStartingSalary];
    }
    
    return self;
}

@end
