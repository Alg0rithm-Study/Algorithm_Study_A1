//
//  ImplementStackUsingQueues.swift
//  LeetCode
//
//  Created by 양호준 on 2022/01/19.
//

import Foundation

class MyStackQueueE {
    var stack = [Int]()

    init() {
        
    }
    
    func push(_ x: Int) {
        stack.append(x)
    }
    
    func pop() -> Int {
        return stack.removeLast()
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func empty() -> Bool {
        return stack.isEmpty
    }
}
