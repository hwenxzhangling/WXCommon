//
//  UITextView+JKInputLimit.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 2016/11/29.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (JKInputLimit)<UITextViewDelegate>

@property (nonatomic, strong) UITextView *jk_placeHolderTextView;
@property (assign, nonatomic)  NSInteger jk_maxLength;//if <=0, no limit

- (void)jk_addPlaceHolder:(NSString *)placeHolder;



@end
