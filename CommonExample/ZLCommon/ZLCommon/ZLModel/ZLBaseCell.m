//
//  ZLBaseCell.m
//  Demo01
//
//  Created by sisyphe.cn on 2020/5/14.
//  Copyright © 2020 sisyphe.cn. All rights reserved.
//

#import "ZLBaseCell.h"

@implementation ZLBaseCell


#pragma mark - LifeCycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self base_setupViews];
    }
    return self;
}


#pragma mark - Public

+ (CGFloat)cellHeightWithModel:(id)model{
    return 0.001;
}


#pragma mark - Private

- (void)base_setupViews{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
}


@end

