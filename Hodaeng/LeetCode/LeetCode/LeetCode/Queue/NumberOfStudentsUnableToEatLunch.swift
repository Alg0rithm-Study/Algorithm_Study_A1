//
//  NumberOfStudentsUnableToEatLunch.swift
//  LeetCode
//
//  Created by 양호준 on 2022/01/15.
//

import Foundation

class SolutionQueueB {
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        var studentsList = students
        var sandwichesList = sandwiches
        var firstStudent = studentsList.removeFirst()
        var firstSandwich = sandwichesList.removeFirst()
        var loopCount = 0
        
        while studentsList.contains(firstSandwich) || firstStudent == firstSandwich {
            if studentsList.isEmpty {
                if firstStudent == firstSandwich {
                    return 0
                } else if firstStudent != firstSandwich {
                    return 1
                }
            }
            if firstStudent == firstSandwich {
                firstStudent = studentsList.removeFirst()
                firstSandwich = sandwichesList.removeFirst()
            } else {
                studentsList.append(firstStudent)
                firstStudent = studentsList.removeFirst()
            }
            loopCount += 1
        }
        return studentsList.count + 1
    }
}


