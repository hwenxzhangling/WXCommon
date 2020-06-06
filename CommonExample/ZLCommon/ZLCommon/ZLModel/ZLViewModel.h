//
//  ZLViewModel.h
//  ZLCommon
//
//  Created by sisyphe.cn on 2020/5/15.
//  Copyright © 2020 sisyphe.cn. All rights reserved.
//

#import "ZLBaseViewModel.h"

typedef NS_ENUM(NSInteger,ViewActionType)
{
    viewActionType_none,
    viewActionType_fetch,
    viewActionType_refresh,
    viewActionType_next,
};
NS_ASSUME_NONNULL_BEGIN

@interface ZLViewModel : ZLBaseViewModel
@property (nonatomic, copy)void(^toastObjectBlock)(NSString *message);
@property (nonatomic, assign)ViewActionType  actionType;
@property (nonatomic, assign)NSInteger pageNum;
@end


NS_ASSUME_NONNULL_END
