//
//  ThirdViewController.m
//  0.题2
//
//  Created by 梁森 on 2020/4/22.
//  Copyright © 2020 LS. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UISwitch *switchBtn;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        [self performSelector:@selector(test) withObject:nil];
        [self performSelector:@selector(test) withObject:nil afterDelay:3.0];
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    });

}
- (void)test{
    NSLog(@"%s", __func__);
}

- (void)test1{
    // 主队列中添加同步任务
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_sync(mainQueue, ^{
        NSLog(@"任务1...");
    });
}
- (void)test2{
    // 主队列中添加异步任务
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_async(mainQueue, ^{
        NSLog(@"任务1...");
    });
}
- (void)test3{
    // 串行队列上添加同步任务
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"任务1...");
        NSLog(@"%@", [NSThread currentThread]);
        dispatch_sync(queue, ^{
            NSLog(@"任务2...");
        });
    });
}
- (void)test4{
    // 串行队列添加的异步任务中在另一个串行队列上添加同步任务
    dispatch_queue_t queue1 = dispatch_queue_create("queue1", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("queue2", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue1, ^{
        NSLog(@"任务1...");
        dispatch_sync(queue2, ^{
            NSLog(@"任务2...");
        });
    });
}
- (void)test5{
    // 并发队列添加的异步任务上添加同步任务
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"任务1...");
        dispatch_sync(queue, ^{
            NSLog(@"任务2...");
        });
    });
}


@end
