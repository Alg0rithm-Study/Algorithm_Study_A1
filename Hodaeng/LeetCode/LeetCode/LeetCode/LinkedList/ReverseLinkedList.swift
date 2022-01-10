//
//  ReverseLinkedList.swift
//  LeetCode
//
//  Created by 양호준 on 2022/01/10.
//

// 막혀서 풀이 참조

import Foundation

class SolutionLinkedListD {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var head = head
        var reversedHead: ListNode?
        var next: ListNode?
        
        while head != nil {
            next = head?.next
            head?.next = reversedHead
            reversedHead = head
            head = next
        }
        
        return reversedHead
    }
}
