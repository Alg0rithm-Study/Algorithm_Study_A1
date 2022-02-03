import Foundation

func firstUniqChar(_ s: String) -> Int {
    var ocurrences: [Character: Int] = [:]

    for char in s {
        ocurrences[char, default: 0] += 1  // *default : 딕셔너리의 value에 기본값 0을 할당함
                // ocurrences[char] = (ocurrences[char] ?? 0) + 1  // 이것도 가능
    }

    for (index, char) in s.enumerated() {
                if ocurrences[char]! == 1 {   // 68 ms, faster than 83.10%
            return index
        }
        continue
    }
    return -1
}
// 풀이
// 주어진 문자열을 for문으로 돌려서 각 character별 개수를 딕셔너리로 만들고
// 다시 주어진 문자열을 enumerated로 for문을 돌려서 딕셔너리 값이 1 (중복되지 않는 character)이면 해당 index를 반환함

// 참고 - Time Limit Exceeded
func firstUniqChar(_ s: String) -> Int {
    for (index, character) in s.enumerated() {
        if s.filter { $0 == character }.count > 1 {
            continue
        }
        return index
    }
    return -1
}


// 다른 풀이
func firstUniqChar1(_ s: String) -> Int {
        for (i, j) in s.enumerated() {
            if s.firstIndex(of: j) == s.lastIndex(of: j) {
                return i
            }
        }
     return -1
}
// String의 firstIndex/lastIndex를 활용함
// 652 ms, faster than 5.09% of Swift online submissions
