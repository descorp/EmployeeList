//
//  Employee+Currency.m
//  EmployeeList
//
//  Created by Vladimir Abramichev on 18/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import "Employee+Currency.h"
#import "Employee.h"

@implementation Employee (Currency)

- (NSString *)salaryString {
    NSNumberFormatter *currencyFormatter = [[NSNumberFormatter new] init];
    [currencyFormatter setLocale:[NSLocale currentLocale]];
    [currencyFormatter setMaximumFractionDigits:2];
    [currencyFormatter setMinimumFractionDigits:2];
    [currencyFormatter setAlwaysShowsDecimalSeparator:YES];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    return [currencyFormatter stringFromNumber:self.salary];
}

@end
