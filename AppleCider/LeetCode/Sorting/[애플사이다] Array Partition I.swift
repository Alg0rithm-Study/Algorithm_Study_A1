import Foundation

func arrayPairSum(_ nums: [Int]) -> Int {
    let sortedNums = nums.sorted()
    var result = 0
    
    for i in 0..<nums.count {
        if i % 2 == 0 {
            result += sortedNums[i]
        }
    }
    
    return result
}
// 풀이
// 최대값을 만들기 위해 순서대로 sorting한 이후 pair로 나눠야 함
// pair의 최소값은 항상 짝수번째 index이므로 해당 값들을 합산함

// 고차함수 사용
func arrayPairSum(_ nums: [Int]) -> Int {
    let sortedNums = nums.sorted()

    return (0..<nums.count).filter { $0 % 2 == 0 }.map { sortedNums[$0] }.reduce(0, +)
}
// xcode에서는 정상 작동하는데, leetcode submit에서 컴파일 에러 발생
// 이렇게 제출하면 Accept됨 (?)
func arrayPairSum(_ nums: [Int]) -> Int {
    let sortedNums = nums.sorted()
    let range = 0..<nums.count
    return range.filter { $0 % 2 == 0 }.map { sortedNums[$0] }.reduce(0, +)
}


// 다른 풀이
func arrayPairSum(_ nums: [Int]) -> Int {
    let tempArray = nums.sorted()
    var result = 0
    for value in tempArray.enumerated() {
        if value.offset % 2 == 0 {
            result += value.element
        }
    }
    return result
}

// 다른 풀이
func arrayPairSum(_ nums: [Int]) -> Int {
  let numsSorted = nums.sorted()
  var output = 0

  for index in stride(from: 0, through: nums.count - 1, by: 2) {
    output += numsSorted[index]
  }

  return output
}
