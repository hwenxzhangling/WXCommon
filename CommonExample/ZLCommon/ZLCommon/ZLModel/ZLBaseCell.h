//
//  ZLBaseCell.h
//  Demo01
//
//  Created by sisyphe.cn on 2020/5/14.
//  Copyright © 2020 sisyphe.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLBaseDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZLBaseCell : UITableViewCell
@property (nonatomic, strong) id model;
@property (nonatomic, weak)   id<ZLBaseDelegate> baseDelegate;

+ (CGFloat)cellHeightWithModel:(id)model;

@end

NS_ASSUME_NONNULL_END
