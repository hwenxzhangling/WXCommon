//
//  NSString+URL.m
//  JZDjCommon
//
//  Created by wapushidai on 2019/11/21.
//  Copyright © 2019 WX. All rights reserved.
//

#import "NSString+URL.h"

@implementation NSString (URL)
- (NSString *)URLEncodedString
{
    return (NSString *)CFBridgingRelease((__bridge CFTypeRef _Nullable)([self stringByAddingPercentEncodingWithAllowedCharacters:[[NSCharacterSet characterSetWithCharactersInString:@"!*'();:@&=+$,/?%#[]"] invertedSet]]));
}
@end
