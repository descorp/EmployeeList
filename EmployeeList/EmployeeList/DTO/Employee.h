//
//  Employee.h
//  EmployeeList
//
//  Created by Vladimir Abramichev on 18/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property (readonly, copy) NSString* name;
@property (readonly) NSUInteger birthYear;
@property (readonly, copy) NSDecimalNumber* salary;

- (instancetype)initWithName:(NSString*)name birthYear:(NSUInteger)birthYear;

@end
