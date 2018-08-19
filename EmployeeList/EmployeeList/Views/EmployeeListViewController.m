//
//  ViewController.m
//  EmployeeList
//
//  Created by Vladimir Abramichev on 18/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import "EmployeeListViewController.h"

@interface EmployeeListViewController ()

@property (readwrite, nonatomic) NSObject<EmployeeDataSource> *dataSource;

@end

@implementation EmployeeListViewController

- (instancetype)initWithEmployeeDataSource:(NSObject<EmployeeDataSource> *)dataSource {    
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.dataSource = dataSource;
    }
    return self;
}

- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl new] init];
    self.refreshControl = refreshControl;
    [refreshControl addTarget:self action:@selector(onRefreshRequested:) forControlEvents:UIControlEventValueChanged];
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(onDataSourceUpdated:)
                                               name:kEmployeeDirectoryDidUpdateNotification
                                             object:nil];
    
    [self.refreshControl beginRefreshing];
    [self onRefreshRequested:refreshControl];
}

- (void)onRefreshRequested:(id)sender {
    if (!self.dataSource.isUpdating) {
        [self.dataSource update];
    }
}

- (void)onDataSourceUpdated:(NSNotification*)notification {
    [self.refreshControl endRefreshing];
}

@end
