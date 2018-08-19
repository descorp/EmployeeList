//
//  EmployeeDirectory.h
//  EmployeeList
//
//  Created by Vladimir Abramichev on 18/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EmployeeDataSource

@property (readonly) NSArray* employees; // returns NSArray of Employee
@property (readonly) BOOL isUpdating;

- (void)update;

@end


// notification posted when the directory finishes updating
extern NSString* const kEmployeeDirectoryDidUpdateNotification;

@interface EmployeeDirectory : NSObject <EmployeeDataSource>

@end
