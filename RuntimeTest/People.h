//
//  People.h
//  Runtime
//
//  Created by zhougj on 15/6/11.
//  Copyright (c) 2015年 iiseeuu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject

@property (nonatomic, strong) NSString *name;

void dynamicMethodIMP(id self, SEL _cmd);

- (void)mysteriousMethod;

@end
