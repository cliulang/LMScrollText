//
//  LMScrollTextView.m
//  LMScrollTextDemo
//
//  Created by zero on 15/8/28.
//  Copyright (c) 2015年 zero. All rights reserved.
//

#import "LMScrollTextView.h"

@interface LMScrollTextView ()

@property (nonatomic,strong) NSMutableArray* useArray;
@property (nonatomic,strong) NSMutableArray* reuseArray;
@property (nonatomic,assign) CGFloat  speed;
@property (nonatomic,assign) NSInteger  currentIndex;
@property (nonatomic,assign) BOOL  suspend;
@end

@implementation LMScrollTextView


- (NSMutableArray*)useArray{
    if(!_useArray){
        _useArray = [NSMutableArray array];
    }
    return _useArray;
}

- (NSMutableArray*)reuseArray{
    if(!_reuseArray){
        _reuseArray = [NSMutableArray array];
    }
    return _reuseArray;
}


- (void)reloadData{
    [self.reuseArray addObjectsFromArray:self.useArray];
    [self.useArray removeAllObjects];
    _currentIndex = 0;
    _speed = 0.1;
    [self startMoveWithDelay:0];
}

- (void)startMoveWithDelay:(CGFloat)delay{
    if(_currentIndex >= self.titleArray.count){
        _currentIndex = 0;
    }
    NSString* title = [self.titleArray objectAtIndex:_currentIndex];
    UILabel* label = nil;
    if(self.reuseArray.count > 0){
        label = [self.reuseArray firstObject];
        [self.reuseArray removeObject:label];
    }else{
        label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, CGRectGetHeight(self.frame))];
        label.font = [UIFont systemFontOfSize:10];
        label.textColor = [UIColor blackColor];
        label.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    }
    label.text = title;
    [self addSubview:label];
    [self.useArray addObject:label];
    CGFloat textWidth = [title boundingRectWithSize:CGSizeMake(1000, CGRectGetHeight(self.frame)) options:NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10]} context:nil].size.width;
    //label开始移动的位置
    label.frame = CGRectMake(CGRectGetWidth(self.frame), 0, textWidth, CGRectGetHeight(self.frame));
    //label完全显示的时间
    CGFloat appearTime = textWidth*_speed/10;
    CGFloat disappearTime = CGRectGetWidth(self.frame)*_speed/10;
    [UIView animateWithDuration:appearTime delay:delay options:UIViewAnimationOptionCurveLinear animations:^{
        label.frame = CGRectOffset(label.frame, -CGRectGetWidth(label.frame), 0);
    } completion:^(BOOL finished) {
        _currentIndex += 1;
        [UIView animateWithDuration:disappearTime delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            label.frame = CGRectOffset(label.frame, -CGRectGetWidth(self.frame), 0);
        } completion:^(BOOL finished) {
            [self.reuseArray addObject:label];
            [self.useArray removeObject:label];
            [label removeFromSuperview];
        }];
        [self startMoveWithDelay:0.2];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
