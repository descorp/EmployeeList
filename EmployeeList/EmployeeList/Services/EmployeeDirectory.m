//
//  EmployeeDirectory.m
//  EmployeeList
//
//  Created by Vladimir Abramichev on 18/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import "EmployeeDirectory.h"
#import "Employee.h"

NSString* const kEmployeeDirectoryDidUpdateNotification = @"kEmployeeDirectoryDidUpdateNotification";

@implementation EmployeeDirectory

- (void)update {
    if(isUpdating == YES) {
        return;
    }
    isUpdating = YES;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self BA_doUpdateInBackground];
    });
}

#pragma mark - Privates

- (void)BA_doUpdateInBackground {
    [NSThread sleepForTimeInterval:2];
    NSArray* name = @[@"Anne", @"Lucas", @"Marc", @"Zeus", @"Hermes", @"Bart", @"Paul", @"John",
                      @"Ringo", @"Dave", @"Taylor"];
    NSArray* surnames = @[@"Hawkins", @"Simpson", @"Lennon", @"Grohl", @"Hawkins", @"Jacobs",
                          @"Holmes", @"Mercury", @"Matthews"];
    NSArray* currencies = @[@"EUR", @"USD", @"CHY", @"RUB", @"KZT", @"GBP", @"TRY", @"JPY", @"AZN"];
    NSUInteger amount = name.count*surnames.count;
    NSMutableArray* employees = [NSMutableArray arrayWithCapacity:amount];
    for(NSUInteger i=0; i<amount; i++) {
        NSString* fullName = [NSString stringWithFormat:@"%@ %@", name[random()%name.count],
                              surnames[random()%surnames.count]];
        [employees addObject:[[Employee alloc] initWithName:fullName
                                                  birthYear:1997-random()%50
                                                     salary:random()%100000
                                                   currency:currencies[random()%currencies.count]]];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self BA_updateDidFinishWithResults:employees];
    });
}

- (void)BA_updateDidFinishWithResults:(NSArray*)results {
    employees = results;
    isUpdating = NO;
    [[NSNotificationCenter defaultCenter]
     postNotificationName:kEmployeeDirectoryDidUpdateNotification object:self];
}

@synthesize employees;

@synthesize isUpdating;

@end
