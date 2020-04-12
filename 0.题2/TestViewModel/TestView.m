//
//  TestView.m
//  0.题2
//
//  Created by 梁森 on 2020/4/12.
//  Copyright © 2020 LS. All rights reserved.
//

#import "TestView.h"

#import <NSObject+RACKVOWrapper.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import <RACSignal.h>
#import "TestViewModel.h"

@interface TestView ()


@end

@implementation TestView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpSubviews];
    }
    return self;
}

- (void)setUpSubviews{
    [self addSubview:self.textfield];
}
- (void)setViewModel:(TestViewModel *)viewModel{
    _viewModel = viewModel;
//    self.textfield.text = viewModel.titleName;
//    [_viewModel rac_observeKeyPath:@"titleName" options:NSKeyValueObservingOptionNew observer:nil block:^(id value, NSDictionary *change, BOOL causedByDealloc, BOOL affectedOnlyLastComponent) {
//        // model数据更改，view上显示的内容更改
//        self.textfield.text = value;
//    }];
}

- (UITextField *)textfield{
    if (_textfield == nil) {
        _textfield = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        _textfield.backgroundColor = [UIColor redColor];
        _textfield.borderStyle = UITextBorderStyleRoundedRect;
        [[_textfield rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
            [self.viewModel.subject sendNext:x];
        }];
    }
    return _textfield;
}

@end
