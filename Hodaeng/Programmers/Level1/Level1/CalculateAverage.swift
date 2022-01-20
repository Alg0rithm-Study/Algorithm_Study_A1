//
//  CalculateAverage.swift
//  Level1
//
//  Created by 양호준 on 2022/01/20.
//

import Foundation

func solution(_ arr:[Int]) -> Double {
    let count = Double(arr.count)
    let sum = arr.reduce(0) { a, b in
        return a + b
    }
    let doubleSum = Double(sum)

    return doubleSum / count
}
