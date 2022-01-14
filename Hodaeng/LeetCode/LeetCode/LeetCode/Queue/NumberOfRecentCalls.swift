//
//  NumberOfRecentCalls.swift
//  LeetCode
//
//  Created by 양호준 on 2022/01/14.
//

import Foundation

class RecentCounter {
    var result: [Int] = []

    init() {
        
    }
    
    func ping(_ t: Int) -> Int {
        var count = 0
        result.append(t)
        result.map { num in
            if num >= t - 3000 && num <= t {
                count += 1
            }
        }
        return count
    }
}
