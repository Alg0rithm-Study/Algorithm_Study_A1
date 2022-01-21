//
//  CollazSpectation.swift
//  Level1
//
//  Created by 양호준 on 2022/01/21.
//

import Foundation

func solution(_ num:Int) -> Int {
    var countNumber = 0
    var result = num
    
    while countNumber < 500, result != 1 {
        if result % 2 == 0 {
            result = result / 2
        } else {
            result = result * 3 + 1
        }
        countNumber += 1
    }
    if countNumber == 500 {
        return -1
    } else {
        return countNumber
    }
}
