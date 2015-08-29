//
//  ViewController.m
//  LMScrollTextDemo
//
//  Created by zero on 15/8/28.
//  Copyright (c) 2015年 zero. All rights reserved.
//

#import "ViewController.h"
#import "LMScrollTextView.h"
@interface ViewController ()
{
    UILabel* label;
    NSString* string;
    NSInteger index;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    index = 0;
//    string = @"的骄傲看过就爱干很多事的顾客啊闪光灯哈工大家阿哥华师大阿迪介绍滚动哈刚收到";
//    label = [[UILabel alloc]initWithFrame:CGRectMake(30, 100, 300, 20)];
//    label.text = string;
//    label.textColor =[UIColor blackColor];
//    [self.view addSubview:label];
//    
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeText) userInfo:nil repeats:YES];
//    [time fire];
    
    LMScrollTextView *statusView = [[LMScrollTextView alloc]initWithFrame:CGRectMake(0, 50, CGRectGetWidth(self.view.frame), 20)];
    statusView.titleArray = @[@"的空间很大大神肯定会",@"的卡号",@"dasdkhjah空间很大空间的卡好看",@"大喊大叫卡仕达接口",@"sdjjahkdhadjakd ",@"dajksgdkajsdgjk",@"的空间很大大神肯定会",@"的卡号",@"dasdkhjah空间很大空间的卡好看",@"大喊大叫卡仕达接口",@"的空间很大大神肯定会",@"的卡号",@"dasdkhjah空间很大空间的卡好看",@"大喊大叫卡仕达接口",@"的空间很大大神肯定会",@"的卡号",@"dasdkhjah空间很大空间的卡好看",@"大喊大叫卡仕达接口"];
    [self.view addSubview:statusView];
    [statusView reloadData];
}
- (void)changeText{
    [UIView animateWithDuration:1 animations:^{
        string = [string substringFromIndex:1];
        label.text = string;
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
