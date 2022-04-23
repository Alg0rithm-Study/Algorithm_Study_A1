import Foundation

// [문자:숫자] Dictionary를 생성
// Dictionary를 for문으로 iterate하여 replacingOccurrences를 사용
func solution(_ s:String) -> Int {
    var arr = [s]
    let dic = ["zero": "0", "one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"]
    
    for number in dic {
        arr = [arr.joined().replacingOccurrences(of: number.key, with: number.value)]
    }
        
    return Int(arr.joined())!
}

// 개선
// s를 Array에 담을 필요 없음
func solution(_ s:String) -> Int {
    var str = s
    let dic = ["zero": "0", "one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"]
    
    for number in dic {
        str = str.replacingOccurrences(of: number.key, with: number.value)
    }
        
    return Int(str)!
}

// 대안 (런타임 오히려 2ms 증가)
// Dictionary 대신 Array 및 enumerated 활용
func solution(_ s:String) -> Int {
    var str = s
    let numbers = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    
    for (index, number) in numbers.enumerated() {
        str = str.replacingOccurrences(of: number, with: String(index))
    }
        
    return Int(str)!
}

// 다른 풀이
// [문자] Array를 만들고 for문으로 iterate하여 replacingOccurrences를 사용
func solution(_ s:String) -> Int {
    let arr = ["zero","one","two","three","four","five","six","seven","eight","nine"]
    var str = s
 
    for i in 0..<arr.count {
        str = str.replacingOccurrences(of: arr[i], with: String(i))
    }

    return Int(str)!
}

// 다른 풀이
// 단순히 연속적으로 replacingOccurrences를 사용함
func solution(_ s:String) -> Int {
    var s = s
    var answer = s.replacingOccurrences(of: "zero", with: "0")
        .replacingOccurrences(of: "one", with: "1")
        .replacingOccurrences(of: "two", with: "2")
        .replacingOccurrences(of: "three", with: "3")
        .replacingOccurrences(of: "four", with: "4")
        .replacingOccurrences(of: "five", with: "5")
        .replacingOccurrences(of: "six", with: "6")
        .replacingOccurrences(of: "seven", with: "7")
        .replacingOccurrences(of: "eight", with: "8")
        .replacingOccurrences(of: "nine", with: "9")

    return Int(answer)!
}
