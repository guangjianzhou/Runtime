//
//  UILabel+Name.m
//  RuntimeTest
//
//  Created by zhougj on 15/7/2.
//  Copyright (c) 2015年 iiseeuu. All rights reserved.
//

#import "UILabel+Name.h"
#import <objc/runtime.h>

@implementation UILabel (Name)

@dynamic labelName;
/**
 *  主要三个函数
 *  void objc_setAssociatedObject() 用于给对象添加关联对象，传入 nil 则可以移除已有的关联对象；
 *  id objc_getAssociatedObject   获取关联对象
 *  void objc_removeAssociatedObjects  用于移除一个对象的所有关联对象
 */

//注：objc_removeAssociatedObjects 函数我们一般是用不上的，因为这个函数会移除一个对象的所有关联对象，将该对象恢复成“原始”状态。这样做就很有可能把别人添加的关联对象也一并移除，这并不是我们所希望的。所以一般的做法是通过给 objc_setAssociatedObject 函数传入 nil 来移除某个已有的关联对象。

//key 值
static char kAssociateKey;
static void *kAssociatedObjectKey;
//3用Selector，实用getter方法的名称作为key值
//@selector(labelName);

- (void)setLabelName:(NSString *)labelName
{
    objc_setAssociatedObject(self, @selector(labelName), labelName
                             , OBJC_ASSOCIATION_RETAIN);

}

- (NSString *)labelName
{
    return objc_getAssociatedObject(self, @selector(labelName));
}

//关联对象与被关联对象本身的存储并没有直接的关系，它是存储在单独的哈希表中的；
//关联对象的五种关联策略与属性的限定符非常类似，在绝大多数情况下，我们都会使用 OBJC_ASSOCIATION_RETAIN_NONATOMIC 的关联策略，这可以保证我们持有关联对象；
//关联对象的释放时机与移除时机并不总是一致，比如实验中用关联策略 OBJC_ASSOCIATION_ASSIGN 进行关联的对象，很早就已经被释放了，但是并没有被移除，而再使用这个关联对象时就会造成 Crash 。

@end
