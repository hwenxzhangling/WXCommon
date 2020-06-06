//
//  ZLCellModel.m
//  Demo01
//
//  Created by sisyphe.cn on 2020/5/14.
//  Copyright © 2020 sisyphe.cn. All rights reserved.
//

#import "ZLCellModel.h"

@implementation ZLCellModel

- (NSString *)reuseIdentifier
{
    _reuseIdentifier = NSStringFromClass(_cellClass);
    return _reuseIdentifier;
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder {

}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

@end


@implementation ZLCellGroupingModel

@end
