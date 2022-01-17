//
//  TimeNeededToBuyTickets.swift
//  LeetCode
//
//  Created by 양호준 on 2022/01/17.
//

// 풀이 참조

import Foundation

class SolutionQueueC {
    func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
        var time = 0
        var temp = tickets
        var leftTicket = tickets[k]
        
        while leftTicket > 0 {
            for index in 0..<tickets.count {
                if temp[index] > 0 {
                    time += 1
                    temp[index] -= 1
                    if index == k {
                        leftTicket -= 1
                        if leftTicket == 0 {
                            return time
                        }
                    }
                }
            }
        }
        return time
    }
}
