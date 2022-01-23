//
//  GCDLCM.swift
//  Level1
//
//  Created by 양호준 on 2022/01/23.
//

import Foundation

func solution(_ n:Int, _ m:Int) -> [Int] {
    var result = [Int]()
    if m % n == 0 {
        result.append(n)
        result.append(m)
    } else {
        for divider in stride(from: n - 1, to: 0, by: -1) {
            if m % divider == 0, n % divider == 0 {
                result.append(divider)
                result.append(m * n / divider)
                break
            }
        }
    }
    
    return result
}
