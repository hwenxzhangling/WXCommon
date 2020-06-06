//
//  ZLBaseDelegate.h
//  ZLCommon
//
//  Created by sisyphe.cn on 2020/5/15.
//  Copyright © 2020 sisyphe.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZLBaseDelegate <NSObject,UITableViewDelegate,UICollectionViewDelegate>

@optional
- (void)actionCell:(id)Cell;
- (void)actionCell:(id)Cell model:(id)model;
- (void)actionCell:(id)Cell model:(id)model model2:(id)model2;
- (void)actionCell:(id)Cell model:(id)model model2:(id)model2 model3:(id)model3;

- (void)actionModel:(id)model;
- (void)actionModel:(id)model model:(id)model;
- (void)actionModel:(id)model model:(id)model model2:(id)model2;
- (void)actionModel:(id)model model:(id)model model2:(id)model2 model3:(id)model3;
@end

NS_ASSUME_NONNULL_END
