//
//  ConcatenationOfArray.swift
//  LeetCode
//
//  Created by 양호준 on 2022/01/09.
//

import Foundation

class SolutionArrayB {
    func getConcatenation(_ nums: [Int]) -> [Int] {
        var arr: [Int] = []
        
        for _ in 1...2 {
            nums.map { element in
                arr.append(element)
            }
        }
        
        return arr
    }
}
