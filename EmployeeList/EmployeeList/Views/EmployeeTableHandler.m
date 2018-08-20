//
//  EmployeeListViewController+TableDataSource.m
//  EmployeeList
//
//  Created by Vladimir Abramichev on 20/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import "EmployeeTableHandler.h"
#import "UITableView+Register.h"
#import "CustomEmployeeViewCell.h"

@interface EmployeeTableHandler ()

@property (nonatomic, copy, readwrite) NSArray<Employee*>* cache;
@property NSOperationQueue *queue;
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation EmployeeTableHandler

- (instancetype)initWithTable:(UITableView*)tableView {
    self = [super init];
    if (self) {
        self.tableView = tableView;
        self.queue = [[NSOperationQueue alloc] init];
        self.queue.qualityOfService = NSQualityOfServiceBackground;
    }
    return self;
}

- (void)updateWith:(NSArray<Employee *> *)collection {
    self.cache = collection;
    [self.tableView reloadData];
}

- (void)nonBlockingSort {
    __block NSArray<Employee*>* snapshot = [[NSMutableArray alloc] initWithArray:self.cache copyItems:YES];
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
         snapshot = [snapshot sortedArrayUsingComparator:^NSComparisonResult(Employee* lhs, Employee* rhs) {
            return [lhs.name compare:rhs.name];
        }];
    }];
    [operation setCompletionBlock:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateWith:snapshot];
        });
    }];
    
    [self.queue addOperation:operation];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return [tableView dequeueCell:CustomEmployeeViewCell.class];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cache.count;
}

@end
