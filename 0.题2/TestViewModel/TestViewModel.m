//
//  TestViewModel.m
//  0.题2
//
//  Created by 梁森 on 2020/4/12.
//  Copyright © 2020 LS. All rights reserved.
//

#import "TestViewModel.h"

#import "TestView.h"
#import "TestModel.h"
#import <NSObject+RACKVOWrapper.h>

@interface TestViewModel ()

@property (nonatomic, strong) TestView *  testView;
@property (nonatomic, strong) TestModel *  testModel;

@end

@implementation TestViewModel

- (instancetype)initWithController:(UIViewController *)VC{
    self = [super init];
    if (self) {
        [self connectViewAndModelWithVC:VC];
    }
    return self;
}
- (void)connectViewAndModelWithVC:(UIViewController *)VC{

    self.testModel.titleName = @"改变前";
    
    [VC.view addSubview:self.testView];
    self.testView.textfield.text = self.testModel.titleName;
    
    [self.subject subscribeNext:^(id  _Nullable x) {
        // view上数据更改后，model数据发生变化
        self.testModel.titleName = x;
    }];
    
    [self.testModel rac_observeKeyPath:@"titleName" options:NSKeyValueObservingOptionNew observer:nil block:^(id value, NSDictionary *change, BOOL causedByDealloc, BOOL affectedOnlyLastComponent) {
        // model数据更改，view上显示的内容更改
        self.testView.textfield.text = value;
    }];

}
- (void)changeData{
    self.testModel.titleName = @"改变后";
}

- (TestView *)testView{
    if (_testView == nil) {
        _testView = [[TestView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
        _testView.backgroundColor = [UIColor yellowColor];
        _testView.viewModel = self;
    }
    return _testView;
}
- (TestModel *)testModel{
    if (_testModel == nil) {
        _testModel = [TestModel new];
    }
    return _testModel;
}
- (RACSubject *)subject{
    if (_subject == nil) {
        _subject = [[RACSubject alloc] init];
    }
    return _subject;
}

@end
