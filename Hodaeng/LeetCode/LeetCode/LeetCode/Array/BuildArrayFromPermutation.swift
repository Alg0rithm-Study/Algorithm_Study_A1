//
//  BuildArrayFromPermutation.swift
//  LeetCode
//
//  Created by 양호준 on 2022/01/09.
//

import Foundation

class SolutionArrayA {
    func buildArray(_ nums: [Int]) -> [Int] {
        let length = nums.count
        var array: [Int] = []
        (0...length - 1).forEach { index in
            array.append(nums[nums[index]])
        }
        
        return array
    }
}
