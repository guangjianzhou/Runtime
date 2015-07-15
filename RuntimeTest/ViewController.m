//
//  ViewController.m
//  RuntimeTest
//
//  Created by zhougj on 15/6/11.
//  Copyright (c) 2015年 iiseeuu. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "People.h"
#import "UIButton+Address.h"
#import "UIViewController+Tracking.h"
#import "NSNotificationCenter+Help.h"
#import "UILabel+Name.h"
#import <objc/runtime.h>
#import "JRSwizzle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];

    
    NSArray *properties = [Student allProperties];
    
    People *p = [[People alloc] init];
    [p mysteriousMethod];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.address = @"菊花校区";
    NSString *address = btn.address;
    NSLog(@"address====%@",address);
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(test:) name:@"notifcation_ZGJ" object:nil];
    
    UILabel *label = [[UILabel alloc] init];
    label.labelName = @"new Label";
    NSString *name = label.labelName;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"====old===========");
    
    
    
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"notifcation_ZGJ" object:nil];
//    });
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"----触摸--");
}

- (void)test:(NSNotification *)cation
{
    NSLog(@"cation==========");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
