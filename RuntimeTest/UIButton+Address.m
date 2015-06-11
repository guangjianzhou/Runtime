//
//  UIButton+Address.m
//  RuntimeTest
//
//  Created by zhougj on 15/6/11.
//  Copyright (c) 2015年 iiseeuu. All rights reserved.
//

#import "UIButton+Address.h"
#import <objc/runtime.h>

@implementation UIButton (Address)

static char keyIdentifier;

@dynamic address;

- (NSString *)address
{
    return objc_getAssociatedObject(self, &keyIdentifier);
}

- (void)setAddress:(NSString *)addressName
{
    objc_setAssociatedObject(self, &keyIdentifier, addressName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
