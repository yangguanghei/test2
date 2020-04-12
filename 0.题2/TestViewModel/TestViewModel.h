//
//  TestViewModel.h
//  0.题2
//
//  Created by 梁森 on 2020/4/12.
//  Copyright © 2020 LS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestViewModel : NSObject

/// 对应着view中的title显示内容
@property (nonatomic, strong) NSString *  titleName;
@property (nonatomic, strong) RACSubject *  subject;

- (instancetype)initWithController:(UIViewController *)VC;
- (void)changeData;

@end

NS_ASSUME_NONNULL_END
