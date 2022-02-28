import Foundation

// 요소 중 두 쌍을 골라 쌍의 곱의 차이가 가장 큰 수를 구하는 것

class SolutionSortE {
    func maxProductDifference(_ nums: [Int]) -> Int {
        let sortedNumbers = nums.sorted() // 정렬하고
        
        let minimumPairMultiple = sortedNumbers[0] * sortedNumbers[1] // 정렬한 것에서 앞에서 2개의 요소 곱
        let maximumPairMulitple = sortedNumbers[nums.count - 1] * sortedNumbers[nums.count - 2] // 뒤에서 2개의 요소 곱
        
        return maximumPairMulitple - minimumPairMultiple // 이들을 뺌
    }
}
