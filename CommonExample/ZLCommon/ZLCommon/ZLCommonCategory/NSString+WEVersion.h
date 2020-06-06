//
//  NSString+WEVersion.h
//  Weather
//
//  Created by yanglin on 2017/1/18.
//  Copyright © 2017年 cxmx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WEVersion)

/**
 对比版本号（eg: 1.0.0 vs 2.0）
 */
- (NSComparisonResult)comparedWithVersion:(NSString *)aVersion;
@end
