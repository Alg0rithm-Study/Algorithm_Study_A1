import Foundation

// 제대로 문제가 요구하는 바를 이해하진 못했지만 정렬을 해서 같은 인덱스의 값의 차이를 계산하는 문제로 파악

class SolutionD {
    func minMovesToSeat(_ seats: [Int], _ students: [Int]) -> Int {
        let sortedSeats = seats.sorted()
        let sortedStudents = students.sorted() // 각각 학생과 좌석을 정렬해줌
        var result = 0 // 반환할 변수
        
        for index in 0..<seats.count { // 좌석 수와 학생 수는 동일해서 처음부터 좌석 수만큼 반복문을 돌릴 수 있도록 함.
            var move = sortedSeats[index] - sortedStudents[index] // 동일한 인덱스의 값을 빼줌
            if move < 0 { // 음수일 경우
                move = -move // 양수로 바꿔주고
            }
            result += move // 더해줌
        }
        
        return result
    }
}
