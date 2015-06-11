//
//  Student.m
//  Runtime
//
//  Created by zhougj on 15/6/5.
//  Copyright (c) 2015年 iiseeuu. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>

@implementation Student

/**
 *  函数名
 *  property_getName
 *  class_getProperty
 *
 */

+ (NSMutableArray *)allProperties
{
    id LenderClass = objc_getClass("Student");
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(LenderClass, &outCount);
    for (i = 0; i < outCount; i++)
    {
        objc_property_t property = properties[i];
        fprintf(stdout, "%s %s\n", property_getName(property), property_getAttributes(property));
        
    }
    return nil;
}


- (void)mysteriousMethod
{
    NSLog(@"student --- - (void)mysteriousMethod;");
}

@end
