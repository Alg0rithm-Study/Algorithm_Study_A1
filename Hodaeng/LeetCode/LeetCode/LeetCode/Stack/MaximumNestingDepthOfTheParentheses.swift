//
//  MaximumNestingDepthOfTheParentheses.swift
//  LeetCode
//
//  Created by 양호준 on 2022/01/14.
//

import Foundation
class SolutionStackA {
    func maxDepth(_ s: String) -> Int {
        var count = 0
        var result = 0
        
        s.map { character in
            switch character {
            case "(":
                count += 1
                result = max(count, result)
            case ")":
                count -= 1
            default:
                break
            }
        }
        return result
    }
}
