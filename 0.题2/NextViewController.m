//
//  NextViewController.m
//  0.题2
//
//  Created by 中创 on 2020/4/7.
//  Copyright © 2020 LS. All rights reserved.
//

#import "NextViewController.h"

#import "CustomTableViewCell.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"CustomTableViewCell"];
    self.tableView.estimatedRowHeight = 44;
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
