//
//  UIView+Toast.h
//  tinghao
//
//  Created by itensen003 on 14-4-21.
//  Copyright (c) 2014年 iTensen. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum{
    PositionTop = 0,
    PositionCenter,
    PositionBottom,
}PositionSite;

@interface UIView (Toast)

// each makeToast method creates a view and displays it as toast

- (void)makeToast:(NSString *)message;
- (void)makeNetToast:(NSString *)message;
- (void)makeToast:(NSString *)message andPostion:(PositionSite)site;
- (void)makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position;

- (void)makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position image:(UIImage *)image;
- (void)makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position title:(NSString *)title;
- (void)makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position title:(NSString *)title image:(UIImage *)image;

// the showToast methods display any view as toast

- (void)showToast:(UIView *)toast;

- (void)showToast:(UIView *)toast duration:(NSTimeInterval)interval position:(id)point;



@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  size;        ///< Shortcut for frame.size.

@end
