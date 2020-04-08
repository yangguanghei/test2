//
//  LayoutsubviewsView.m
//  0.题2
//
//  Created by 中创 on 2020/4/7.
//  Copyright © 2020 LS. All rights reserved.
//

#import "LayoutsubviewsView.h"

#import "Masonry.h"

@interface LayoutsubviewsView ()



@end

@implementation LayoutsubviewsView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setUpSubviews];
    }
    return self;
}

- (void)setUpSubviews{
    self.backgroundColor = [UIColor redColor];
    [self addSubview:self.subView1];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.subView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.mas_top).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
    }];
    self.subView1.text = @"就框架离开就离开发了空间开了房案件来看解放路卡时代峻峰";
}

#pragma mark --- 懒加载
- (UILabel *)subView1{
    if (_subView1 == nil) {
        _subView1 = [UILabel new];
        _subView1.backgroundColor = [UIColor yellowColor];
        _subView1.numberOfLines = 0;
    }
    return _subView1;
}

@end
