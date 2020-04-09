//
//  ReverseList.m
//  0.题2
//
//  Created by 中创 on 2020/4/9.
//  Copyright © 2020 LS. All rights reserved.
//

#import "ReverseList.h"

@implementation ReverseList

struct Node * constructList(void){
    struct Node * head = NULL;  // 头节点
    struct Node * end = NULL;  // 尾节点
    for (int i = 0; i < 5; i ++) {
        struct Node * node = malloc(sizeof(struct Node));
        node->data = i;
        if (head == NULL) {
            head = node;
        }
        else{
            end->next = node;
        }
        end = node;
    }
    end->next = NULL;
    return head;
}

struct Node * reverseList(struct Node * head){
    struct Node * newHead = NULL;
    struct Node * p = NULL;
    p = head;
    while (p != NULL) {
        struct Node * temp = p->next;   // 1
        p->next = newHead;   // 指向之前的头节点
        newHead = p;    // 更新头节点
        p = temp;   // 4.   1和4是为了p移动
    }
    return newHead;
}

void printList(struct Node * head){
    struct Node * temp = head;
    while (temp != NULL) {
        printf("数据：%d", temp->data);
        temp = temp->next;
    }
}

@end
