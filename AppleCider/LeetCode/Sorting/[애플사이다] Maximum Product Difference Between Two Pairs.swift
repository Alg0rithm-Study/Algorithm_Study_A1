import Foundation

func maxProductDifference(_ nums: [Int]) -> Int {
    let sortedNums = nums.sorted()
    
    return (sortedNums[nums.count-1] * sortedNums[nums.count-2]) - (sortedNums[0] * sortedNums[1])
}
// 풀이
// 최대값을 만들기 위해 가장 큰 수 2개, 가장 작은 수 2개를 뽑음
// Time complexity: O(nlogn) since we are sorting an input array.
// Space complexity: O(n) since we are storing a new copy of an input array.

// 다른 풀이 - 직접 sorting
func maxProductDifference2(_ nums: [Int]) -> Int {
    var max = Int.min // nums의 최대값 요소와 대체하기 위해 임의의 작은 값을 할당
    var secondMax = Int.min
    
    var min = Int.max // nums의 최소값 요소와 대체하기 위해 임의의 큰 값을 할당
    var secondMin = Int.max
    
    for num in nums {
        if num > max {
            secondMax = max
            max = num
        } else if num > secondMax {
            secondMax = num
        }

        if num < min {
            secondMin = min
            min = num
        } else if num < secondMin {
            secondMin = num
        }
    }
    
    return (max * secondMax) - (min * secondMin)
}
// Time complexity: O(n).
// Space complexity: O(1).
