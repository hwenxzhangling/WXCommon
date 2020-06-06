//
//  ZLBaseView.h
//  ZLCommon
//
//  Created by sisyphe.cn on 2020/5/15.
//  Copyright © 2020 sisyphe.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLBaseDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZLBaseView : UIView
@property (nonatomic,weak)id<ZLBaseDelegate> baseDelegate;
@property (nonatomic, strong) id            model;
@end

NS_ASSUME_NONNULL_END
