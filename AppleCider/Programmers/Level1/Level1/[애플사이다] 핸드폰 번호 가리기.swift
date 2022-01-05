import Foundation

func solution(_ phone_number:String) -> String {
    var starCount = phone_number.count - 4
    
//  var result = Array(repeating: "*", count: starCount).joined()
    var result = String(repeating: "*", count: starCount)  // String init도 가능

    (0..<4).forEach { index in
        result.append(phone_number[phone_number.index(phone_number.endIndex, offsetBy: index - 4)])
    }
        
    return result
}

// 다른 답변
func solution(_ phone_number:String) -> String {
    return "\(String(repeating: "*", count: phone_number.count - 4))\(phone_number.suffix(4))"  // Substring을 문자열 보간법에 바로 사용 가능
}

// 다른 답변
func solution(_ phone_number:String) -> String {
    guard phone_number.count > 4 else { return phone_number }
    return String(phone_number.enumerated().map{($0.offset<phone_number.count-4 ? Character("*") : $0.element)})  // ?????
}
