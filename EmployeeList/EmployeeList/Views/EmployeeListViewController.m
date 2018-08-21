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
#import "EmployeeTableHandler.h"

@interface EmployeeListViewController ()

@property (readwrite, nonatomic) NSObject<EmployeeDataProvider> *dataProvider;
@property (readwrite, nonatomic) EmployeeTableHandler *tableHandler;
@property NSInteger sortCount;

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
    
    self.tableView.rowHeight = 60;
    
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
    
    UIBarButtonItem *sortButton = [[UIBarButtonItem new] initWithImage:[UIImage imageNamed:@"baseline_sort_black_24pt"]
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(onSortButtonPressed:)];
    self.navigationItem.rightBarButtonItem = sortButton;
}

- (void)onSortButtonPressed:(id)sender {
    switch (self.sortCount % 4) {
        case 0:
            [self.tableHandler nonBlockingSortWith:^NSComparisonResult(Employee *lhs, Employee *rhs) {
                return [lhs.name compare:rhs.name];
            }];
            break;
        case 1:
            [self.tableHandler nonBlockingSortWith:^NSComparisonResult(Employee *lhs, Employee *rhs) {
                if (lhs.birthYear > rhs.birthYear) {
                    return NSOrderedDescending;
                } else if (lhs.birthYear < rhs.birthYear) {
                    return NSOrderedAscending;
                }
                return NSOrderedSame;
            }];
            break;
        case 2:
            [self.tableHandler nonBlockingSortWith:^NSComparisonResult(Employee *lhs, Employee *rhs) {
                return [lhs.salary compare:rhs.salary];
            }];
            break;
        case 3:
            [self.tableHandler nonBlockingSortWith:^NSComparisonResult(Employee *lhs, Employee *rhs) {
                return [lhs.currencyCode compare:rhs.currencyCode];
            }];
            break;
    }
    self.sortCount += 1;
}

- (void)onRefreshRequested:(id)sender {
    if (!self.dataProvider.isUpdating) {
        self.sortCount = 0;
        [self.dataProvider update];
    }
}

- (void)onDataSourceUpdated:(NSNotification*)notification {
    [self.refreshControl endRefreshing];
    
    NSArray *data = self.dataProvider.employees;
    [self.tableHandler updateWith:data];
}

@end
