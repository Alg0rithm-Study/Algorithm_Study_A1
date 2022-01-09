//
//  ConvertBinaryNumberInALinkedListToInteger.swift
//  LeetCode
//
//  Created by 양호준 on 2022/01/09.
//

import Foundation

class SolutionLinkedListA {
    func getDecimalValue(_ head: ListNode?) -> Int {
        var arr: [Int] = []
        var currentHead = head
        while currentHead != nil {
            arr.append(currentHead!.val)
            currentHead = currentHead?.next
        }
        
        var sum = 0
        var squared = Double(arr.count) - 1
        arr.forEach { element in
            sum += element * Int(pow(2, squared))
            squared -= 1
        }
        return sum
    }
}
