import Foundation

func maxDepth(_ s: String) -> Int {
    var maximum = 0, depth = 0
    
    for character in s {
        if character == "(" {
            depth += 1
            maximum = max(maximum, depth)
        }
        else if character == ")" {
            depth -= 1
        }
    }
    
    return maximum
}
// 풀이
// String을 for문으로 iterate하여 Character에 접근하고
// "("이면 depth를 1 높이고,")"이면 1 낮추는 방식으로 depth 값을 변경하며
// 괄호 형태에 따라 유동적으로 변경되는 depth 값 중에서 최대값을 반환함

// 다른 답변
func maxDepth(_ s: String) -> Int {
        var maximum = 0, depth = 0
        
        for char in s {
            switch char {
            case "(":
                depth += 1
                maximum = max(maximum, depth)
            case ")":
                depth -= 1
            default:
                continue
            }
        }
        
        return maximum
}
// switch문을 사용하여 개선 가능
