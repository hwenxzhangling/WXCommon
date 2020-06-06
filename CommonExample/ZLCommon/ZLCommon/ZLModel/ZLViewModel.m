//
//  ZLViewModel.m
//  ZLCommon
//
//  Created by sisyphe.cn on 2020/5/15.
//  Copyright © 2020 sisyphe.cn. All rights reserved.
//

#import "ZLViewModel.h"

@interface  ZLViewModel()
@property (nonatomic,assign)NSInteger currentPage;
@end
@implementation ZLViewModel
- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.currentPage = 1;
        self.pageNum = 10;
    }
    return self;
}

- (void)setActionType:(ViewActionType)actionType
{
    switch (actionType) {
        case viewActionType_none:
            break;
        case viewActionType_fetch:
            break;
        case viewActionType_refresh:
            break;
        case viewActionType_next:
            break;
        default:
            break;
    }
}
@end
