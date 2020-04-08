//
//  NextViewController.h
//  0.题2
//
//  Created by 中创 on 2020/4/7.
//  Copyright © 2020 LS. All rights reserved.
//

#import "LSBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface NextViewController : LSBaseTableViewController

@property (nonatomic, assign) void(^dismissBlock)(void);

@end

NS_ASSUME_NONNULL_END
