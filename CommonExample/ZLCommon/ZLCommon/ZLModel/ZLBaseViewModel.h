//
//  ZLBaseViewModel.h
//  Demo01
//
//  Created by sisyphe.cn on 2020/5/14.
//  Copyright © 2020 sisyphe.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZLCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZLBaseViewModel : ZLCellGroupingModel

+ (void)registCellTableView:(UITableView *)tableView subClassArray:(NSArray *)subClassArray;
+ (void)registCellCollectionView:(UICollectionView *)collectionView subClassArray:(NSArray *)subClassArray forSupplementaryViewOfKind:(NSString *)elementKind;

+ (instancetype)initBaseViewClass:(Class)classs forModel:(id)model forCellHeight:(CGFloat)cellHeight;

+ (instancetype)initBaseViewClass:(Class)classs forModel:(id)model forCellHeight:(CGFloat)cellHeight cellHeaderTitle:(NSString *)cellHeaderTitle;

+ (instancetype)initBaseViewClass:(Class)classs forModel:(id)model forCellHeight:(CGFloat)cellHeight cellFooterTitle:(NSString *)cellFooterTitle;

+ (instancetype)initBaseViewClass:(Class)classs forModel:(id)model forCellHeight:(CGFloat)cellHeight cellFooterTitle:(NSString *)cellFooterTitle cellHeaderTitle:(NSString *)cellHeaderTitle;

+ (instancetype)initBaseViewClass:(Class)classs forModel:(id)model forCellHeight:(CGFloat)cellHeight headerModel:(id)headerModel cellHeaderTitle:(NSString *)cellHeaderTitle;

@end

NS_ASSUME_NONNULL_END
