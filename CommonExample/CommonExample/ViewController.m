//
//  ViewController.m
//  CommonExample
//
//  Created by sisyphe.cn on 2020/5/15.
//  Copyright © 2020 sisyphe.cn. All rights reserved.
//

#import "ViewController.h"
#import <ZLCommon/UIColor+JZDjHex.h>
#import <ZLCommon/UIView+Toast.h>
#import "TestView.h"
#import "IndexCalendarView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)IndexCalendarView *headerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //self.view.backgroundColor = [UIColor colorWithHexString:@"000000"];
//
//    TestView *test = [[TestView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
//    test.model = [UIColor redColor];
//    [self.view addSubview:test];
//
//    TestView *test1 = [[TestView alloc] initWithFrame:CGRectMake(test.left+30, test.bottom+30, 100, 100)];
//    test1.model = [UIColor blueColor];
//    [self.view addSubview:test1];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    
    self.headerView = [[IndexCalendarView alloc] init];
    self.headerView.model = nil;
    self.headerView.frame = CGRectMake(0, 0, self.tableView.width, 320);
    self.headerView.baseScrollView = self.tableView;
    self.tableView.tableHeaderView = self.headerView;
    self.headerView.backgroundColor = [[UIColor brownColor] colorWithAlphaComponent:0.3];
    
    __weak typeof(self) ws = self;
    self.headerView.updateBlock = ^(CGFloat y) {
        ws.headerView.frame = CGRectMake(0, 0, ws.tableView.width, (320-y <= 0 ? 0 : 320-y ));
        ws.tableView.tableHeaderView = ws.headerView;
    };
    NSLog(@"fff:%@",NSStringFromCGRect(self.headerView.frame));
}

#pragma mark - UITableViewDelegate&DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"index:%@",@(indexPath.row)];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

@end
