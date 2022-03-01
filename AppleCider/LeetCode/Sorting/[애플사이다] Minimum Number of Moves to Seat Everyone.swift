import Foundation

func minMovesToSeat(_ seats: [Int], _ students: [Int]) -> Int {
    var result = 0
    let sortedSeats = seats.sorted()
    let sortedStudents = students.sorted()
    
    for i in 0..<seats.count {
        result += abs(sortedSeats[i] - sortedStudents[i])
    }
    
    return result
}
// 풀이
// 동일한 index의 2개 숫자의 차의 절대값을 구하여 합산함

// 다른 풀이
func minMovesToSeat2(_ seats: [Int], _ students: [Int]) -> Int {
    zip(seats.sorted(), students.sorted()).map { abs($0 - $1) }.reduce(0, +)
}

// 다른 풀이
func minMovesToSeat3(_ seats: [Int], _ students: [Int]) -> Int {
    zip(seats.sorted(), students.sorted()).reduce(0) { $0 + abs($1.0 - $1.1) }
}


// 참고 - zip 메서드
// Creates a sequence of pairs built out of two underlying sequences.
let words = ["one", "two", "three", "four"]
let numbers = 1...4

for (word, number) in zip(words, numbers) {
    print("\(word): \(number)")
}
// Prints "one: 1"
// Prints "two: 2
// Prints "three: 3"
// Prints "four: 4"

let naturalNumbers = 1...Int.max
let zipped = Array(zip(words, naturalNumbers))
// zipped == [("one", 1), ("two", 2), ("three", 3), ("four", 4)]
