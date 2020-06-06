//
//  TestView.m
//  CommonExample
//
//  Created by sisyphe.cn on 2020/5/15.
//  Copyright © 2020 sisyphe.cn. All rights reserved.
//

#import "TestView.h"

@implementation TestView

- (void)setModel:(id)model
{
    [super setModel:model];
    if([model isKindOfClass:[UIColor class]])
    {
        UIColor *color = model;
        self.backgroundColor = color;
    }
}

@end
