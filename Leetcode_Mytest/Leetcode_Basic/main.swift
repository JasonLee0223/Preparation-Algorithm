//
//  main.swift
//  Leetcode_Basic
//
//  Created by 이건행 on 2022/01/12.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    //public init() { self.val = 0; self.next = nil; }
    //public init(_ val: Int) { self.val = val; self.next = nil; }
    
    public init(_ val: Int, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}
 
func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    if head?.val == nil { return nil }

    var node = head                         // 첫 node를 head만 가져옴

    while node?.next != nil {               // 다음 node가 없을 때까지 반복
        if node?.val == node?.next?.val {   // 현재node의 val != 다음node의 val이 같은 경우
            node?.next = node?.next?.next   // 현재node를 다음 node의 포인터로 지정
        } else {
        node = node?.next                   // node를 다음 node로 치환
        }
    }
    return head                             // node는 하나의 node일 뿐 연결리스트 전체가 아니여서 head 반환
}
