//
//  MiddleOfTheLinkedList.swift
//  LeetCode
//
//  Created by 양호준 on 2022/01/09.
//

import Foundation

class SolutionLinkedListB{
    func middleNode(_ head: ListNode?) -> ListNode? {
        var count = 0
        var firstHead = head
        var currentHead = head
        while currentHead != nil {
                count += 1
                currentHead = currentHead?.next
            }
        if count <= 1 {
            return firstHead
        } else {
            var middle: Int {
            if count % 2 == 0 {
                return count / 2
            } else {
                return Int(floor(Double(count / 2)))
            }
        }
        (1...middle).forEach { count in
            firstHead = firstHead?.next
        }
        return firstHead
        }
    }
}
