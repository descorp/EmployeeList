//
//  UITableViewCell+Register.m
//  EmployeeList
//
//  Created by Vladimir Abramichev on 20/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import "UITableView+Register.h"
#import "UITableViewCell+Identifier.h"

@implementation UITableView (Register)

- (void)registerCellClass:(Class)aClass {
    [self validateClass:aClass];
    NSString *cellIdentifier = [aClass performSelector:@selector(defaultCellIdentifier)];
    [self registerClass:aClass forCellReuseIdentifier:cellIdentifier];
}

- (void)validateClass:(Class)aClass {
    if ([aClass isSubclassOfClass:[UITableViewCell class]] == NO) {
        NSString *message = [NSString stringWithFormat:
                             @"Invalid class '%@' - "
                             @"a view should be a subclass of UITableViewCell", NSStringFromClass(aClass)] ;
        @throw [NSException exceptionWithName:@"IncorrectClass" reason:message userInfo:nil];
    }
}

- (UITableViewCell*)dequeueCell:(Class)aClass {
    [self validateClass:aClass];
    NSString *cellIdentifier = [aClass performSelector:@selector(defaultCellIdentifier)];
    return [self dequeueReusableCellWithIdentifier:cellIdentifier];
}

@end
