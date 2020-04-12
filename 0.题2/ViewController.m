//
//  ViewController.m
//  0.题2
//
//  Created by 中创 on 2020/4/7.
//  Copyright © 2020 LS. All rights reserved.
//

#import "ViewController.h"

#import "LayoutsubviewsView.h"

#import "Masonry.h"
#import "MJExtension.h"

#import "NextViewController.h"
#import "ReverseList.h"

#import "TestViewModel.h"

@interface ViewController ()

@property (strong) NSObject * name;
@property (nonatomic, strong) LayoutsubviewsView * view;
/// 用于测试viewModel的ViewModel
@property (nonatomic, strong) TestViewModel *  viewModel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    
//    [self testLayoutsubviews];
    
    [self viewModel];
}

// 测试layoutsubviews方法
- (void)testLayoutsubviews{
    LayoutsubviewsView * view = [LayoutsubviewsView new];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(100);
        make.top.equalTo(self.view.mas_top).offset(100);
        make.right.equalTo(self.view.mas_right).offset(-100);
    }];
    self.view = view;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self presentNextVC];
    
//    [self deadLoop];
    
//    [self jsonStringToDict];
    
//    [self testBadAccess];
    
//    [self charReverse];
    
//    [self testReverseList];
    
    [self testViewModel];
}

// 测试ViewModel
- (void)testViewModel{
    [self.viewModel changeData];
}
- (TestViewModel *)viewModel{
    if (_viewModel == nil) {
        _viewModel = [[TestViewModel alloc] initWithController:self];
    }
    return _viewModel;
}

// 反转链表
- (void)testReverseList{
    struct Node * head = constructList();
    printList(head);
    NSLog(@"反转之后的链表");
    struct Node * newHead = reverseList(head);
    printList(newHead);
}

// 字符传反转
- (void)charReverse{
    char ch[] = "hello,world!";
    char * begin = ch;
    char * end = ch + strlen(ch) - 1;
    while (begin < end) {
        char temp = *begin;
        *begin = *end;
        *end = temp;
        begin ++;
        end --;
    }
    printf("反转后的字符串：%s", ch);
}

// JSON字符串转字典
- (void)jsonStringToDict{
    NSString * str = @"{\"old\":\"1   ///8:&:   1\", \"new\":\"2   2    2\"}";
    
    NSLog(@"str:%@", str);
    
    NSString * firstStr = @"{\"old\":\"";
    NSString * secondStr = @"\", \"new\":\"";
    NSString * thirdStr = @"\"}";
    
    NSRange firstRange = [str rangeOfString:firstStr];
    NSRange secondRange = [str rangeOfString:secondStr];
    NSRange thirdRange = [str rangeOfString:thirdStr];
        
    
    NSString * content1 = [str substringWithRange:NSMakeRange(firstRange.location + firstRange.length, secondRange.location-firstRange.location-firstRange.length)];
    NSString * content2 = [str substringWithRange:NSMakeRange(secondRange.location + secondRange.length, thirdRange.location-secondRange.location-secondRange.length)];
    NSLog(@"content1:%@", content1);
    NSLog(@"content2:%@", content2);
    
    NSString * newContent1 = [self JSONString:content1];
    NSString * newContent2 = [self JSONString:content2];
    
    NSMutableString * mutableStr = [NSMutableString stringWithString:firstStr];
    [mutableStr appendString:newContent1];
    [mutableStr appendString:secondStr];
    [mutableStr appendString:newContent2];
    [mutableStr appendString:thirdStr];
    
    
    NSDictionary * dict = [mutableStr mj_JSONObject];
    NSLog(@"dict:%@", dict);
    self.view.subView1.text = dict[@"old"];
}

- (void)testBadAccess{
        for (NSInteger i = 0; i < 100000; i ++) {
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                self.name = [NSObject new];
            });
        }
}

-(NSString *)JSONString:(NSString *)aString {
    NSMutableString *s = [NSMutableString stringWithString:aString];
//        [s replaceOccurrencesOfString:@"\"" withString:@"\\\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
//        [s replaceOccurrencesOfString:@"/" withString:@"\\/" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
//        [s replaceOccurrencesOfString:@"\n" withString:@"\\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
//        [s replaceOccurrencesOfString:@"\b" withString:@"\\b" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
//        [s replaceOccurrencesOfString:@"\f" withString:@"\\f" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
//        [s replaceOccurrencesOfString:@"\r" withString:@"\\r" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
//        [s replaceOccurrencesOfString:@"\t" withString:@"\\t" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
        [s replaceOccurrencesOfString:@"\\" withString:@"\\\\" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
        return [NSString stringWithString:s];
}

// 死循环
- (void)deadLoop{
    [self deadLoop];
}

- (void)presentNextVC{
    NextViewController * nextVC = [NextViewController new];
    [self presentViewController:nextVC animated:YES completion:nil];
    nextVC.dismissBlock = ^{
        NSLog(@"NextVC消失了...");
    };
}

@end
