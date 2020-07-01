//
//  IndexCalendarView.h
//  CommonExample
//
//  Created by babyzzz on 2020/7/1.
//  Copyright © 2020 sisyphe.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ZLCommon/UIView+Toast.h>
NS_ASSUME_NONNULL_BEGIN

typedef void(^IndexCalenDarViewBlock)(CGFloat y);
@interface IndexCalendarView : UIView
@property (nonatomic,strong)UIScrollView *baseScrollView;
@property (nonatomic,strong)id model;
@property (nonatomic,copy)IndexCalenDarViewBlock updateBlock;
@end

NS_ASSUME_NONNULL_END
