//
//  NextViewController.m
//  0.题2
//
//  Created by 中创 on 2020/4/7.
//  Copyright © 2020 LS. All rights reserved.
//

#import "NextViewController.h"

#import "CustomTableViewCell.h"
#import "Masonry.h"

@interface NextViewController ()

@property (nonatomic, assign) NSInteger  count;


@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"CustomTableViewCell"];
    self.tableView.estimatedRowHeight = 44;
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-200);
    }];
    self.view.backgroundColor = [UIColor yellowColor];
    self.count = 6;
    NSLog(@"%@", [NSRunLoop currentRunLoop].currentMode);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        __weak typeof(self) weakSelf = self;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            weakSelf.count = 20;
            NSLog(@"%@", [NSRunLoop currentRunLoop].currentMode);
            [self.tableView reloadData];
        });
    });
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell" forIndexPath:indexPath];
    cell.titleLbl.text = @"就框架离开就离开发了空间开了房案件来看解放路卡时代峻峰";
//    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self dismissViewControllerAnimated:YES completion:nil];
    if (self.dismissBlock) {
        self.dismissBlock();
    }
}

- (void)dealloc{
    NSLog(@"%s", __func__);
}

@end
