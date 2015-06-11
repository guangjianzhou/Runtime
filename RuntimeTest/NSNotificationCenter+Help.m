//
//  NSNotificationCenter+Help.m
//  RuntimeTest
//
//  Created by zhougj on 15/6/11.
//  Copyright (c) 2015年 iiseeuu. All rights reserved.
//

#import "NSNotificationCenter+Help.h"
#import <objc/runtime.h>

@implementation NSNotificationCenter (Help)

+ (void)load
{
    SEL original = @selector(postNotificationName:object:);
    SEL replacement = @selector(SMNotification_postNotificationName:object:);
    
    method_exchangeImplementations(class_getInstanceMethod(self, original),
                                   class_getInstanceMethod(self, replacement));
}

- (void)SMNotification_postNotificationName:(NSString *)name  object:(id)objec
{
//    NSLog(@"=======name = %@===huhu",name);
}



@end
