import Foundation

class Solution {
    func mostWordsFound(_ sentences: [String]) -> Int {
        var counts: [Int] = []

        for sentence in sentences {
            var count = 0
            for char in sentence {
                if char == " " {
                    count += 1
                }
            }
            counts.append(count)
        }

        return counts.max()! + 1
    }
}
// 풀이
// 배열에 든 각각의 sentence의 공백 개수를 구해서 Int 타입 배열에 넣고
// max 메서드로 가장 큰 수를 구한 뒤 1을 더함 (공백 개수 + 1 = 단어의 개수)

// 위 로직에 고차함수를 사용
class Solution {
    func mostWordsFound(_ sentences: [String]) -> Int {
        return sentences.map { $0.filter { $0 == " " }.count }.max()! + 1
    }
}
