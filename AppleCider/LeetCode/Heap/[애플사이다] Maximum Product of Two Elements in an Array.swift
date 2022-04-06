import Foundation

func maxProduct(_ nums: [Int]) -> Int {
    let numbers = nums.sorted(by: >)
    return (numbers[0] - 1) * (numbers[1] - 1)
}
// 풀이
// sorted를 통해 값을 정렬함
// Time Complexity : O(n * log n)
// runtime 20 ms

// 다른 방법 (runtime 40 ms)
func maxProduct(_ nums: [Int]) -> Int {
    var numbers = nums
    var maximum = 0
    var secondMaximum = 0

    for number in numbers {
        maximum = max(maximum, number) // 배열.max()를 쓰는 방법도 있음 - O(n)
    }

    let index = numbers.firstIndex(of: maximum)!
    numbers.remove(at: index)  // O(n)

    for number in numbers {
        secondMaximum = max(secondMaximum, number)
    }

    return (maximum - 1) * (secondMaximum - 1)
}
// for문을 2번 돌려서 max, secondMax를 구함

// 다른 방법-2 (runtime 20 ms)
// 1개 for문 내에서 max, secondMax를 구함
func maxProduct(_ nums: [Int]) -> Int {
    var numbers = nums
    var maximum = 0
    var secondMaximum = 0

    for number in numbers {
        if number > maximum {
            secondMaximum = maximum
            maximum = number
        } else if number > secondMaximum {
            secondMaximum = number
        }
    }

    return (maximum - 1) * (secondMaximum - 1)
}
