class Solution {
    func buildArray(_ nums: [Int]) -> [Int] {
        var ans: [Int] = []
        for index in 0..<nums.count {
            ans.append(nums[nums[index]])
        }
        return ans
    }
}
// 풀이
// 문제에서 제시된 요구조건을 그대로 활용함

// 다른 답변 (위 벙법과 메모리/속도 거의 동일함)
class Solution {
    func buildArray(_ nums: [Int]) -> [Int] {
        return nums.map { nums[$0] }  // map에 들어가는 Collection element 순서대로 새로운 Collection이 만들어짐을 이용함
    }
}
//Time complexity: O(n).
//Space complexity: O(n).
