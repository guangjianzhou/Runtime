//
//  People.m
//  Runtime
//
//  Created by zhougj on 15/6/11.
//  Copyright (c) 2015年 iiseeuu. All rights reserved.
//

#import "People.h"
#import "Student.h"
#import <objc/runtime.h>

@interface People ()


@end


@implementation People
//系统不会默认生成  set、get方法
@dynamic name;
//@synthesize name;


#pragma mark - 动态添加方法
//方法执行顺序:resolveInstanceMethod(NO)->forwardingTargetForSelector(nil)->methodSignatureForSelector

//实例方法
+ (BOOL)resolveInstanceMethod:(SEL)aSEL
{
    return NO;//消息转发机制会被触发
    
    //添加新方法
    if (aSEL == @selector(mysteriousMethod))
    {
        class_addMethod([self class], aSEL, (IMP) dynamicMethodIMP, "v@:");
//        return YES;//mysteriousMethod方法为，会执行dynamicMethodIMP函数体
    }
    return [super resolveInstanceMethod:aSEL];
}

void dynamicMethodIMP(id self, SEL _cmd)
{
    // implementation ....
    NSLog(@"haha-------");
}


//类方法
+ (BOOL)resolveClassMethod:(SEL)sel
{
    return [super resolveClassMethod:sel];
}

#pragma mark - 消息转发
//重定向
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    return nil;//
    Student *s = [[Student alloc] init];
    //mysteriousMethod 没有实现,让Student 去实现
    if(aSelector == @selector(mysteriousMethod:))
    {
        return s;//student  去实现
    }
    return [super forwardingTargetForSelector:aSelector];
}

//在重写forwardInvocation:的同时也要重写methodSignatureForSelector:方法
//转发
//就像一个不能识别的消息的分发中心，将这些消息转发给不同接收对象
//只有在消息接收对象中无法正常响应消息时才会被调用
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    Student *someOtherObject = [[Student alloc] init];
    //方法名称:[anInvocation selector]
    if ([someOtherObject respondsToSelector:
         [anInvocation selector]])
        [anInvocation invokeWithTarget:someOtherObject];
    else
        [super forwardInvocation:anInvocation];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSString *sel = NSStringFromSelector(aSelector);
    if ([sel rangeOfString:@"set"].location == 0)
    {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }
    else
    {
        return [NSMethodSignature signatureWithObjCTypes:"@@:"];
    }
}


//转发 A、B NSobject，A没有实现方法MethodA,可以通过转发让B来实现MethodA
//和继承实现差不多，为了更容易欺骗别人,必须实现三个方法:respondsToSelector:/isKindOfClass:/instancesRespondToSelector


#pragma mark - 动态添加变量
- (void)test
{
//    objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
//    objc_getAssociatedObject(id object, const void *key);
//    objc_removeAssociatedObjects(id object);
}


#pragma mark - Method Swizzling 















@end
