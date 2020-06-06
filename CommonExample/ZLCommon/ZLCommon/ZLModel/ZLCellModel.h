//
//  ZLCellModel.h
//  Demo01
//
//  Created by sisyphe.cn on 2020/5/14.
//  Copyright © 2020 sisyphe.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLCellModel : NSObject<NSCoding>
@property (nonatomic, strong) id            model;
@property (nonatomic, strong) Class         cellClass;
@property (nonatomic, copy)   NSString      *reuseIdentifier;
@property (nonatomic, assign) NSIndexPath   *indexPath;
@property (nonatomic, assign) CGFloat       cellHeight;

@end


@interface ZLCellGroupingModel :ZLCellModel
@property (nonatomic, strong) Class         headerClass;
@property (nonatomic, strong) Class         footerClass;

@property (nonatomic, assign) CGFloat       headerHeight;
@property (nonatomic, assign) CGFloat       footerHeight;

@property (nonatomic,strong)id headerModel;
@property (nonatomic,strong)id footerModel;
@property (nonatomic,strong)NSString        *cellHeaderTitle;
@property (nonatomic,strong)NSString        *cellFooterTitle;

@end
NS_ASSUME_NONNULL_END
