//
//  CustomTableViewCell.m
//  0.题2
//
//  Created by 中创 on 2020/4/7.
//  Copyright © 2020 LS. All rights reserved.
//

#import "CustomTableViewCell.h"

#import "Masonry.h"

@interface CustomTableViewCell ()



@end

@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpSubviews];
    }
    return self;
}
- (void)setUpSubviews{
    [self addSubview:self.titleLbl];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.mas_top).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
    }];
}


#pragma mark --- 懒加载
- (UILabel *)titleLbl{
    if (_titleLbl == nil) {
        _titleLbl = [UILabel new];
        _titleLbl.numberOfLines = 0;
    }
    return _titleLbl;
}

@end
