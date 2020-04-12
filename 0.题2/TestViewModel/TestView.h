//
//  TestView.h
//  0.题2
//
//  Created by 梁森 on 2020/4/12.
//  Copyright © 2020 LS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface TestView : UIView

@property (nonatomic, strong) UITextField *  textfield;
@property (nonatomic, weak) TestViewModel *  viewModel;

@end

NS_ASSUME_NONNULL_END
