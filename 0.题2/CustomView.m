//
//  CustomView.m
//  0.题2
//
//  Created by 梁森 on 2020/6/28.
//  Copyright © 2020 LS. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSLog(@"%s", __func__);
//    [super touchesBegan:touches withEvent:event];
//}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
//        [self addGestureRecognizer:tap];
    }
    return self;
}
- (void)click{
    NSLog(@"%s", __func__);
}

@end
