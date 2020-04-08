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

@interface ViewController ()

@property (strong) NSObject * name;
@property (nonatomic, strong) LayoutsubviewsView * view;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    
    [self testLayoutsubviews];
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
    
    [self jsonStringToDict];
    
//    [self testBadAccess];
}

// JSON字符串转字典
- (void)jsonStringToDict{
    NSString * str = @"{\"old\":\"🙂   \"8:&:   🙂\", \"new\":\"🙂   2    🙂\"}";
    
    NSLog(@"str:%@", str);
    
    NSString * firstStr = @"{\"old\":\"";
    NSString * secondStr = @"\", \"new\":\"";
    NSString * thirdStr = @"\"}";
    
    NSRange firstRange = [str rangeOfString:firstStr];
    NSRange secondRange = [str rangeOfString:secondStr];
    NSRange thirdRange = [str rangeOfString:thirdStr];
    
    NSRange range2 = [[str substringFromIndex:firstRange.location + firstRange.length] rangeOfString:secondStr];
    
    
    NSString * content1 =
    NSString * content2 = [[str substringWithRange:NSMakeRange(secondRange.location, <#NSUInteger len#>);
    NSLog(@"%@", content1);
    NSLog(@"%@", content2);
    
    NSString * newContent1 = [self JSONString:content1];
    NSString * newContent2 = [self JSONString:content2];
    
    NSMutableString * mutableStr = [NSMutableString stringWithString:firstStr];
    [mutableStr appendString:newContent1];
    [mutableStr appendString:secondStr];
    [mutableStr appendString:content2];
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
    [s replaceOccurrencesOfString:@"\"" withString:@"\\\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"/" withString:@"\\/" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\n" withString:@"\\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\b" withString:@"\\b" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\f" withString:@"\\f" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\r" withString:@"\\r" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\t" withString:@"\\t" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
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
