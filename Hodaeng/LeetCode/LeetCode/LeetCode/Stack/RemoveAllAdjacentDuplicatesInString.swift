//
//  RemoveAllAdjacentDuplicatesInString.swift
//  LeetCode
//
//  Created by 양호준 on 2022/01/18.
//

import Foundation

class SolutionStackD {
    func removeDuplicates(_ s: String) -> String {
        var stack = [Character]()
        
        for character in s {
            if let lastStack = stack.last, lastStack == character {
                stack.removeLast()
            } else {
                stack.append(character)
            }
        }
        return String(stack)
    }
}
