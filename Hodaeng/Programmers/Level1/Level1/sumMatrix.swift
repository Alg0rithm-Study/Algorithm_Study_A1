//
//  sumMatrix.swift
//  Level1
//
//  Created by 양호준 on 2022/01/09.
//

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    let arrCount = arr1.count - 1
    let arrElementCount = arr1[0].count - 1
    var arr: [[Int]] = [[]]
    
    var arr1Element: Int
    var arr2Element: Int
    
    for index in 0...arrCount {
        var array: [Int] = []
        let firstArr1 = arr1[index]
        let firstArr2 = arr2[index]
        for index in 0...arrElementCount {
            var sum: Int
            arr1Element = firstArr1[index]
            arr2Element = firstArr2[index]
            sum = arr2Element + arr1Element
            array.append(sum)
        }
        arr.append(array)
    }
    arr.removeFirst()
    
    return arr
}
