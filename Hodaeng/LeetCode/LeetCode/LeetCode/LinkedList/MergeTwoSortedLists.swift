//
//  MergeTwoSortedLists.swift
//  LeetCode
//
//  Created by 양호준 on 2022/01/11.
//

import Foundation
//
//class SolutionLinkedListE {
//    var head: ListNode?
//    var tail: ListNode?
//    
//    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//        var list3: ListNode?
//        while list1 != nil && list2 != nil {
//            var currentList1 = list1
//            var currentList2 = list2
//
//            
//            if list1?.val == list2?.val {
//                list3 = ListNode(currentList1!.val)
//                list3?.next = currentList2!.val
//            }
//            return list3
//        }
//        return nil
//    }
//    
//    func append(_ data: Int) {
//        let newNode = ListNode(data)
//        
//        guard let lastNode = tail else {
//            head = newNode
//            tail = newNode
//            return
//        }
//        
//        lastNode.next = newNode
//        tail = newNode
//    }
//}
