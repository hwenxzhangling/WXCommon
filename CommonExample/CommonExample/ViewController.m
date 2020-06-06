//
//  ViewController.m
//  CommonExample
//
//  Created by sisyphe.cn on 2020/5/15.
//  Copyright © 2020 sisyphe.cn. All rights reserved.
//

#import "ViewController.h"
#import <ZLCommon/UIColor+JZDjHex.h>
#import "TestView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"000000"];
    
    TestView *test = [[TestView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    test.model = [UIColor redColor];
    [self.view addSubview:test];
}


@end
