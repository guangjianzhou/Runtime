//
//  UIButton+Address.h
//  RuntimeTest
//
//  Created by zhougj on 15/6/11.
//  Copyright (c) 2015年 iiseeuu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Address)

//关联对象添加属性
@property (nonatomic, strong) NSString *address;


/**
 *  关联对象实用场景
 * 1.为现有的类添加私有变量以帮助实现细节
 * 2.为现有的类添加公有属性
 * 3.为KVO创建一个关联的观察者
 */

@end
