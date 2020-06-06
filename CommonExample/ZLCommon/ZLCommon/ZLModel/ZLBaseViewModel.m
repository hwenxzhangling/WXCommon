//
//  ZLBaseViewModel.m
//  Demo01
//
//  Created by sisyphe.cn on 2020/5/14.
//  Copyright © 2020 sisyphe.cn. All rights reserved.
//

#import "ZLBaseViewModel.h"

@implementation ZLBaseViewModel

+ (void)registCellTableView:(UITableView *)tableView subClassArray:(NSArray *)subClassArray;
{
    NSAssert(tableView,@"tableView nil");
    NSAssert(subClassArray, @"subClassArray nil");
    for (Class subClass in subClassArray) {
        if([subClass isKindOfClass:[UITableViewCell class]])
        {
            [tableView registerClass:subClass forCellReuseIdentifier:NSStringFromClass(subClass)];
        }else if ( [subClass isKindOfClass:[UITableViewHeaderFooterView class]])
        {
            [tableView registerClass:subClass forHeaderFooterViewReuseIdentifier:NSStringFromClass(subClass)];
        }
    }
}

+ (void)registCellCollectionView:(UICollectionView *)collectionView subClassArray:(NSArray *)subClassArray forSupplementaryViewOfKind:(NSString *)elementKind;
{
    NSAssert(collectionView,@"collectionView nil");
    NSAssert(subClassArray, @"subClassArray nil");
    for (Class subClass in subClassArray) {
        if([subClass isKindOfClass:[UICollectionViewCell class]])
        {
            [collectionView registerClass:subClass forCellWithReuseIdentifier:NSStringFromClass(subClass)];
        }else if ( [subClass isKindOfClass:[UICollectionReusableView class]])
        {
            [collectionView registerClass:subClass forSupplementaryViewOfKind:elementKind withReuseIdentifier:NSStringFromClass(subClass)];
        }
    }
}

+ (instancetype)initBaseViewClass:(Class)classs forModel:(id)model forCellHeight:(CGFloat)cellHeight;
{
    ZLBaseViewModel *viewModel = [[ZLBaseViewModel alloc] init];
    viewModel.cellClass = classs;
    viewModel.model = model;
    viewModel.cellHeight = cellHeight;
    return viewModel;
}

+ (instancetype)initBaseViewClass:(Class)classs forModel:(id)model forCellHeight:(CGFloat)cellHeight cellHeaderTitle:(NSString *)cellHeaderTitle;
{
    ZLBaseViewModel *viewModel = [[ZLBaseViewModel alloc] init];
    viewModel.cellClass = classs;
    viewModel.model = model;
    viewModel.cellHeight = cellHeight;
    viewModel.cellHeaderTitle = cellHeaderTitle;
    return viewModel;
}

+ (instancetype)initBaseViewClass:(Class)classs forModel:(id)model forCellHeight:(CGFloat)cellHeight cellFooterTitle:(NSString *)cellFooterTitle;
{
    ZLBaseViewModel *viewModel = [[ZLBaseViewModel alloc] init];
    viewModel.cellClass = classs;
    viewModel.model = model;
    viewModel.cellHeight = cellHeight;
    viewModel.cellHeaderTitle = cellFooterTitle;
    return viewModel;
}

+ (instancetype)initBaseViewClass:(Class)classs forModel:(id)model forCellHeight:(CGFloat)cellHeight cellFooterTitle:(NSString *)cellFooterTitle cellHeaderTitle:(NSString *)cellHeaderTitle;
{
    ZLBaseViewModel *viewModel = [[ZLBaseViewModel alloc] init];
    viewModel.cellClass = classs;
    viewModel.model = model;
    viewModel.cellHeight = cellHeight;
    viewModel.cellFooterTitle = cellFooterTitle;
    viewModel.cellHeaderTitle = cellHeaderTitle;
    return viewModel;
}

+ (instancetype)initBaseViewClass:(Class)classs forModel:(id)model forCellHeight:(CGFloat)cellHeight headerModel:(id)headerModel cellHeaderTitle:(NSString *)cellHeaderTitle;
{
    ZLBaseViewModel *viewModel = [[ZLBaseViewModel alloc] init];
    viewModel.cellClass = classs;
    viewModel.model = model;
    viewModel.cellHeight = cellHeight;
    viewModel.headerModel = headerModel;
    viewModel.cellHeaderTitle = cellHeaderTitle;
    return viewModel;
}
@end
