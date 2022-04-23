import Foundation

// Logic
// 1/4/7은 왼손, 3/6/9는 오른손
// 이외 숫자는 왼손 거리와 오른손 거리를 비교하여 판단
// 거리비교를 위해 switch문 사용
func solution(_ numbers:[Int], _ hand:String) -> String {
    var result = ""
    let numbers = numbers.map { Int(String($0).replacingOccurrences(of: "0", with: "11"))! }
    var prevLeft = 10
    var prevRight = 12
    
    for number in numbers {
        let left = [1, 4, 7]
        let right = [3, 6, 9]
        
        if left.contains(number) {
            result.append("L")
            prevLeft = number
        } else if right.contains(number) {
            result.append("R")
            prevRight = number
        } else {
            let leftDistance = distance(prevLeft, number)
            let rightDistance = distance(prevRight, number)
            if leftDistance < rightDistance {
                result.append("L")
                prevLeft = number
            } else if leftDistance > rightDistance {
                result.append("R")
                prevRight = number
            } else { // 거리가 같은 경우
                if hand == "left" {
                   result.append("L")
                   prevLeft = number
                } else {
                    result.append("R")
                    prevRight = number
                }
            }
        }
    }
    
    return result
}

func distance(_ a: Int, _ b: Int) -> Int {
    switch abs(a - b) {
    case 0:
        return 0
    case 1, 3: // ex) 1: 1-2 이동, 3: 2-5 이동
        return 1
    case 2, 4, 6:
        return 2
    case 5, 7, 9:
        return 3
    default: // case 8, 10:
        return 4
    }
}
