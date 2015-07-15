//
//  UIViewController+Tracking.m
//  RuntimeTest
//
//  Created by zhougj on 15/6/11.
//  Copyright (c) 2015年 iiseeuu. All rights reserved.
//

#import "UIViewController+Tracking.h"
#import <objc/runtime.h>
#import "JRSwizzle.h"

@implementation UIViewController (Tracking)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(xxx_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod); 
        } 
    }); 
} 



//Swizzling 应该在+load方法中实现，因为+load是在一个类最开始加载时调用
//+ (void)load
//{
//    
//    @synchronized(self) {
//        SEL originalSelector = @selector(viewWillAppear:);
//        SEL swizzedSelector = @selector(zgjWillAppear:);
//        NSError *error = nil;
//        
//        //    BOOL issuccess = [UIViewController jr_swizzleClassMethod:originalSelector withClassMethod:swizzedSelector error:&error];
//        //    NSLog(@"%i  %@",issuccess,error);
//        method_exchangeImplementations(class_getInstanceMethod(self, originalSelector),
//                                       class_getInstanceMethod(self, swizzedSelector));
//    }
//
//
//    
//    return;
//    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class class = [self class];
//        
//        SEL originalSelector = @selector(viewWillAppear:);
//        SEL swizzedSelector = @selector(new_viewWillAppear:);
//        
//        Method originalMethod = class_getInstanceMethod(class, originalSelector);
//        Method swizzedlMethod = class_getInstanceMethod(class, swizzedSelector);
//        
//        //添加方法
//        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzedlMethod), method_getTypeEncoding(swizzedlMethod));
//        if (didAddMethod)
//        {
//            class_replaceMethod(class, swizzedSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
//        }
//        else
//        {
//            method_exchangeImplementations(originalMethod, swizzedlMethod);
//        }
//        
//    });
// 
//}
//
- (void)xxx_viewWillAppear:(BOOL)animated
{
    [self xxx_viewWillAppear:animated];
    NSLog(@"new_=========zgjWillAppear: %@", self);
}

@end
