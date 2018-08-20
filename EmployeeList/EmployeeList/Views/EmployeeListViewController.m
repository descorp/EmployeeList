//
//  ViewController.m
//  EmployeeList
//
//  Created by Vladimir Abramichev on 18/08/2018.
//  Copyright © 2018 Backbase. All rights reserved.
//

#import "EmployeeListViewController.h"
#import "UITableView+Register.h"
#import "CustomEmployeeViewCell.h"
#import "EmployeeTableHandler.m"

@interface EmployeeListViewController ()

@property (readwrite, nonatomic) NSObject<EmployeeDataProvider> *dataProvider;
@property (readwrite, nonatomic) EmployeeTableHandler *tableHandler;

@end

@implementation EmployeeListViewController

- (instancetype)initWithEmployeeDataSource:(NSObject<EmployeeDataProvider> *)dataProvider {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.dataProvider = dataProvider;
        self.tableHandler = [[EmployeeTableHandler new] initWithTable:self.tableView];
    }
    return self;
}

- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerCellClass:CustomEmployeeViewCell.class];
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
    if (!self.dataProvider.isUpdating) {
        [self.dataProvider update];
    }
}

- (void)onDataSourceUpdated:(NSNotification*)notification {
    [self.refreshControl endRefreshing];
    
    NSArray *data = self.dataProvider.employees;
    [self.tableHandler updateWith:data];
}

@end
