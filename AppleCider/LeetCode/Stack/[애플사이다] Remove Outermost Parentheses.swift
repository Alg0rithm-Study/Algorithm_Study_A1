import Foundation

func removeOuterParentheses(_ s: String) -> String {
    var depth = 0, temp: String = "", result: [String] = []
    
    for character in s {
        temp.append(String(character))
        
        switch character {
        case "(":
            depth += 1
        case ")":
            depth -= 1
        default:
            continue
        }
        
        if depth == 0 {
            temp.removeFirst()
            temp.removeLast()
            result.append(temp)
            temp = ""
        }
    }
    
    return result.joined()
}
// 풀이
// String을 for문으로 iterate하여 Character에 접근하고
// "("이면 depth를 1 높이고,")"이면 1 낮추는 방식으로 depth 값을 변경하며
// depth가 0이 되면 해당 구간까지의 String에서 첫째 및 마지막 괄호를 제거하고 (removing outer parentheses), 배열에 추가한 뒤
// 최종적으로 배열의 String을 joined 하여 반환함
// ex. "(()())(())" -> "(()())" + "(())" -> outermost 괄호 제거하여 "()()()"

// 다른 풀이
func removeOuterParentheses(_ S: String) -> String {
    var result = "", depth = 0

    for character in S {
        if character == "(" {
           if depth > 0 {
              result.append(character)
           }
           depth += 1  // 맨 앞의 "("는 append 되지 않음
        } else {
           depth -= 1
           if depth > 0 {  // 맨 뒤의 ")"는 append 되지 않음
               result.append(character)
           }
        }
    }

    return result
}
// 위 방법의 중간과정이 생략되는 장점을 가짐
// ex. "(()())(())" -> "()()()"
