import Foundation

class Solution {
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        var students = students  // 배열을 변경해야하므로 변수에 다시 할당
        var sandwiches = sandwiches
        let repeatCount = students.count * (students.count + 1) / 2  // 학생 수가 n명일 때, 최대 n(n+1)/2 번 비교해야 함
        
        for _ in 0..<repeatCount {
            guard sandwiches.first != nil, students.first != nil else {  // guard문이 없으면 런타임 오류 발생 (index range 초과)
                return students.count
            }
            
            if sandwiches[0] == students[0] {
                sandwiches.removeFirst()
                students.removeFirst()
            } else {
                let removedStudent = students.removeFirst()
                students.append(removedStudent)
            }
        }
        
        return students.count
    }
}
// 풀이
// 샌드위치의 index0이 학생의 index0과 일치하면, 둘다 배열에서 삭제함
// 일치하지 않으면, 학생을 배열의 맨 뒤로 보냄
// 샌드위치-학생을 비교하는 경우의 수 (학생 수가 n명일 때, 최대 n(n+1)/2 번 비교)만큼 반복문을 돌림
// faster than 100.00% of Swift online submissions


// 참고 - 단순히 students 배열요소의 합과 sandwiches 배열의 합을 뺄셈만 해도 될까? => 안됨
func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
    let sumOfStudents = students.reduce(0, +)
    let sumOfSandwiches = sandwiches.reduce(0, +)

    return abs(sumOfStudents - sumOfSandwiches)
}
학생    [1,1,1,1]
샌드위치 [0,1,1,1]
=> 답은 4인데 1을 반환하는 문제 발생
즉, 샌드위치의 순서가 중요함


// 다른 풀이
func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
    var ctrs: [Int] = [0, 0]

    // count zeros and ones in students
    ctrs[1] = students.reduce(0, +)     // 1번 샌드위치를 원하는 학생의 수 (배열의 합계를 활용!!!)
    ctrs[0] = students.count - ctrs[1]  // 0번 샌드위치를 원하는 학생의 수

    // go over the sandwiches queue
    for sandwich in sandwiches {
        if ctrs[sandwich] == 0 {
            break  // stop if there is no student of the kind left
        }
        ctrs[sandwich] -= 1  // decrement number of students of the kind (해당 샌드위치, 학생을 배열에서 삭제)
    }

    // return number of students left
    return max(ctrs[0], ctrs[1])
}
// 학생이 배열의 맨뒤로 이동하는 과정을 고려하지 않음
// 샌드위치로 for문을 돌려서 "맨 앞의 샌드위치"와 일치하는 학생이 없을 때, 남은 학생 수를 반환함
