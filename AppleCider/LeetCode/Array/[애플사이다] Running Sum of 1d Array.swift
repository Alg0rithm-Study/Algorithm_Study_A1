import Foundation

func runningSum(_ nums: [Int]) -> [Int] {
    var result: [Int] = []
    
    for index in 0..<nums.count {
        var sum = 0
        for i in 0..<(index + 1) {
            sum += nums[i]
        }
        result.append(sum)
    }
    
    return result
}
// 풀이
// 이중 for문을 사용하여 현재 index만큼 배열 요소를 더하고 배열에 append함

// 다른 답변
func runningSum(_ nums: [Int]) -> [Int] {
    var arr : [Int] = []
    var sum = 0

    for n in nums{
        sum += n
        arr.append(sum)  // 각 index를 더해가는 중간중간 배열에 append함
    }

    return arr
}

// 다른 답변
func runningSum(_ nums: [Int]) -> [Int] {
    var res = [Int](repeating: 0, count: nums.count)
    res[0] = nums[0]

    for i in 1..<nums.count {
        res[i] = res[i - 1] + nums[i]  // 이전 index의 숫자와 자기자신을 더해줌
    }
 
    return res
}

// 다른 답변
func runningSum(_ nums: [Int]) -> [Int] {
        var sum = 0
        return nums.map { (sum += $0, sum).1 }
}
// 풀이
// map 내부의 괄호에는 Tuple이 들어있음 -> ((), sum) 형태임
// Tuple.1 이므로 최종적으로 sum 값이 반환됨

print(nums.map { (sum += $0, sum) })
[((), 1), ((), 3), ((), 6), ((), 10)]  // 출력값 참고

// 다른 답변 (고차함수)
func runningSum(_ nums: [Int]) -> [Int] {
        (0..<nums.count).map { nums[0...$0].reduce(0,+) }  // 이렇게 range로 배열을 만들 수 있음
}

nums = [1,2,3,4,5]
nums[0...2] = [1,2,3]
