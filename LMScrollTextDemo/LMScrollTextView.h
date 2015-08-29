//
//  LMScrollTextView.h
//  LMScrollTextDemo
//
//  Created by zero on 15/8/28.
//  Copyright (c) 2015年 zero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMScrollTextView : UIView

@property (nonatomic,strong) NSArray* titleArray;
- (void)reloadData;
@end
