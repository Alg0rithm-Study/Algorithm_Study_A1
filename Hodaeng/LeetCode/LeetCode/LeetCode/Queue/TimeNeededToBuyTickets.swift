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
        var overNumber = 0
        for number in tickets[k+1..<tickets.count] {
            if number > tickets[k] {
                overNumber += 1
            }
        }
        
        while leftTicket > 0 {
            for index in 0..<tickets.count { // 창구를 도는 것
                if temp[index] > 0 { // 창구에 남은 인원이 있는지 확인 없으면 넘어감
                    time += 1 // 시간 늘리고
                    temp[index] -= 1 // 인원 줄이고
                    if index == k { // k에 있는 열은 따로 빼서 검증해줌.
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
