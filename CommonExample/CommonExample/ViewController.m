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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //self.view.backgroundColor = [UIColor colorWithHexString:@"000000"];
    
    TestView *test = [[TestView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    test.model = [UIColor redColor];
    [self.view addSubview:test];
    
    TestView *test1 = [[TestView alloc] initWithFrame:CGRectMake(test.left+30, test.bottom+30, 100, 100)];
    test1.model = [UIColor blueColor];
    [self.view addSubview:test1];
}


@end
