import Foundation

class Solution {
    func finalValueAfterOperations(_ operations: [String]) -> Int {
        return operations.filter { ["++X", "X++"].contains($0) }.count - operations.filter { ["--X", "X--"].contains($0) }.count
    }
}
// 풀이
// 아래 코드를 축약함
// ++ 기호는 1을 더하고, -- 기호는 1을 빼도록 하기 위해
// 주어진 배열에서 "++X" 또는 "X++"인 String의 count에서 "--X" 또는 "X--"인 String의 count를 뺌

// 위와 동일한 방법 (풀어씀)
class Solution {
    func finalValueAfterOperations(_ operations: [String]) -> Int {
        return counts(symbol: ["++X", "X++"], from: operations) - counts(symbol: ["--X", "X--"], from: operations)
    }

    func counts(symbol: [String], from operations: [String]) -> Int {
        return operations.filter { symbol.contains($0) }.count
    }
}

// 다른 방법
func finalValueAfterOperations(_ operations: [String]) -> Int {
    return operations.map { $0.contains("++") ? 1 : -1 }.reduce(0, +)
}
// 풀이
// map 및 reduce 고차함수를 활용
// 배열 요소 중에서 "++"를 포함하면 더할 값을 1, 아니면 -1로 변환하기 위해 삼항연산자를 활용
// String 배열을 map에 넣어서 Int 배열을 만들 수 있음
