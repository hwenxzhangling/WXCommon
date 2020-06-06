//
//  NSString+WEVersion.m
//  Weather
//
//  Created by yanglin on 2017/1/18.
//  Copyright © 2017年 cxmx. All rights reserved.
//

#import "NSString+WEVersion.h"

@implementation NSString (WEVersion)


/**
 对比版本号（eg: 1.0.0 vs 2.0）
 */
- (NSComparisonResult)comparedWithVersion:(NSString *)aVersion{
    
    NSInteger oriPointCount = self.length - [self stringByReplacingOccurrencesOfString:@"." withString:@""].length;
    NSInteger aftPointCount = aVersion.length - [aVersion stringByReplacingOccurrencesOfString:@"." withString:@""].length;
    
    NSString *oriVer = [self stringByReplacingOccurrencesOfString:@"." withString:@""];
    NSString *aftVer = [aVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
    
    NSString *zero = @"00000";
    NSString *oriAppendingStr = [zero substringWithRange:NSMakeRange(0, zero.length - oriPointCount)];
    NSString *aftAppendingStr = [zero substringWithRange:NSMakeRange(0, zero.length - aftPointCount)];
    
    oriVer = [oriVer stringByAppendingString:oriAppendingStr];
    aftVer = [aftVer stringByAppendingString:aftAppendingStr];

    return [oriVer compare:aftVer];
}

@end
