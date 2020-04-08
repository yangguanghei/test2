//
//  LSBaseTableViewController.h
//  分销App
//
//  Created by 梁森 on 2018/8/20.
//  Copyright © 2018年 梁森. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LSBaseTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSMutableArray * dataArr;


@end
