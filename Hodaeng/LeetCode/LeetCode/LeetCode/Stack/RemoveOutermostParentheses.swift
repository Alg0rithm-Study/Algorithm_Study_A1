//
//  RemoveOutermostParentheses.swift
//  LeetCode
//
//  Created by 양호준 on 2022/01/15.
//

import Foundation

class SolutionStackB {
    func removeOuterParentheses(_ s: String) -> String {
        var result = ""
        var count = 0
        for character in s {
            switch character {
            case "(":
                if count > 0 {
                    result.append(character)
                }
                count += 1
            case ")":
                count -= 1
                if count > 0 {
                    result.append(character)
                }
            default:
                break
            }
        }
        return result
    }
}
