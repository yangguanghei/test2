//
//  ReverseList.h
//  0.题2
//
//  Created by 中创 on 2020/4/9.
//  Copyright © 2020 LS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

struct Node{
    int data;
    struct Node * next;
};

@interface ReverseList : NSObject

// 构造一个列表
struct Node * constructList(void);
/// 反转列表
struct Node * reverseList(struct Node * head);
// 打印链表中的数据
void printList(struct Node * head);

@end

NS_ASSUME_NONNULL_END
