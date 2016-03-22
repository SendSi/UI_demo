//
//  NSArray+Log.m
//  UI_demo
//
//  Created by scuplt on 16-3-22.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)

/**  专门 针对 中文 编码 不正确 出现转义为英文   */
-(NSString *)descriptionWithLocale:(id)locale{
   NSMutableString *strM= [NSMutableString stringWithFormat:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n",obj];//appendFormat
    }];
    [strM appendString:@")"];//appendString
    return  strM;
}
@end
