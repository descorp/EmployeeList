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
        _currencyCode = @"EUR";
    }
    
    return self;
}

- (instancetype)initWithName:(NSString*)name
                   birthYear:(NSUInteger)birthYear
                      salary:(NSUInteger)salary
                    currency:(NSString*)code {
    self = [super init];
    if(self) {
        _name = name;
        _birthYear = birthYear;
        _salary = [[NSDecimalNumber alloc] initWithUnsignedInteger:salary];
        _currencyCode = code;
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.birthYear forKey:@"birthYear"];
    [aCoder encodeObject:self.salary forKey:@"salary"];
    [aCoder encodeObject:self.salary forKey:@"currencyCode"];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        _name = [aDecoder decodeObjectForKey:@"name"];
        _salary = [aDecoder decodeObjectForKey:@"salary"];
        _birthYear = [aDecoder decodeIntegerForKey:@"birthYear"];
        _currencyCode = [aDecoder decodeObjectForKey:@"currencyCode"];
    }
    return self;
}

@end
