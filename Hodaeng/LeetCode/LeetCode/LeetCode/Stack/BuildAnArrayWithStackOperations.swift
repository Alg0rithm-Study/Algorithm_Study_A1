//
//  BuildAnArrayWithStackOperations.swift
//  LeetCode
//
//  Created by 양호준 on 2022/01/19.
//

import Foundation

class SolutionStackE {
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
            var stack = [String]()
            var element = 1
            var index = 0
            
            while index < target.count {
                if target[index] == element {
                    stack.append("Push")
                    index += 1
                } else {
                    stack.append("Push")
                    stack.append("Pop")
                }
                element += 1
            }
            return stack
        }
}
