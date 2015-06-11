//
//  Student.h
//  Runtime
//
//  Created by zhougj on 15/6/5.
//  Copyright (c) 2015年 iiseeuu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (strong, nonatomic) NSString *sName;
@property (strong, nonatomic) NSString *sAddress;
@property (strong, nonatomic) NSString *schoolName;

+ (NSMutableArray *)allProperties;
- (void)mysteriousMethod;
@end
