import Foundation

class SolutionSortF {
    func targetIndices(_ nums: [Int], _ target: Int) -> [Int] {
        var numbers = nums.sorted() // 일단 배열을 정렬
        var result = [Int]()
        var count = 0 // 일단 인덱스가 있으면 이를 제거하거 다시 인덱스를 찾기 때문에 인덱스가 밀리게 되서 반복문을 돈 만큼 더해주기 위한 수
        
        while numbers.firstIndex(of: target) != nil { // 일단 타겟의 숫자가 존재하면 반복문 돈다
            guard let numberIndex = numbers.firstIndex(of: target) else { return [] }
            result.append(numberIndex + count) // 반복문 돈 횟수와 index를 더해서 result에 추가해줌
            count += 1
            numbers.remove(at: numberIndex) // 이미 찾은 인덱스의 경우 제거해줌
        }
        return result
    }
}
