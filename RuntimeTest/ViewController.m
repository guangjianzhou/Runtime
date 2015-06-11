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

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
