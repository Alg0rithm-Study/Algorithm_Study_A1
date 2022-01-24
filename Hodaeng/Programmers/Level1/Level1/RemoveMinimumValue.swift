//
//  RemoveMinimumValue.swift
//  Level1
//
//  Created by 양호준 on 2022/01/25.
//

import Foundation

func solution(_ arr:[Int]) -> [Int] {
    var temp = arr
    var index = 0
    var minimum = arr.min()!
    temp.forEach { int in
        if int == minimum {
            temp.remove(at: index)
        }
        index += 1
    }
    if temp.isEmpty {
        return [-1]
    }
    return temp
}
