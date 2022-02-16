import Foundation

func removeDuplicates(_ s: String) -> String {
    var stack = [Character]()

    for char in s {
        if let last = stack.last, last == char {
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }

    return String(stack)  // String을 배열로 초기화 가능
}
// 풀이
// 새로운 Stack을 만드는 과정에서 중복 여부를 확인함
// Stack에 가장 최근에 추가한 Character (문자열의 끝)과 주어진 문자열의 다음 Character의 중복 여부를 비교함
// 비교 결과 중복되지 않으면 Stack에 추가하고, 중복되면 Stack의 마지막 요소를 삭제함
// 190 ms, faster than 47.71%


// 위 풀이 개선
// 128 ms, faster than 89.54%
func removeDuplicates(_ s: String) -> String {
    var stack = ""  // Character 배열을 문자열로 교체 (반환 시 타입변환 필요 없음)

    for char in s {
        if let last = stack.last, last == char {
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }

    return stack
}
