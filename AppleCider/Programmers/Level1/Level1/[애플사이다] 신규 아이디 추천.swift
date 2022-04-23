import Foundation

func solution(_ new_id:String) -> String {
    // step1
    var id = new_id.lowercased()
    
    // step2. 알파벳, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거
    let validCharacters = ["-", "_", "."]
    id = id.filter { $0.isLetter || $0.isNumber || validCharacters.contains(String($0)) }
    
    // step3
    while id.contains("..") {
        id = id.replacingOccurrences(of: "..", with: ".")
    }
    
    // step4
    id = id.trimmingCharacters(in: ["."])
    
    // step5
    if id.isEmpty {
        id = "a"
    }
    
    // step6
    if id.count >= 16 {
        id = String(id.prefix(15))
    }
    
    if id.suffix(1) == "." {
        id = String(id.prefix(14))
    }
    
    // step7
    while id.count < 3 {
        id.append(id.last!)
    }
    
    return id
}

// step4 다른 방법
while id.hasPrefix(".") {
    id.removeFirst()
 }
 while id.hasSuffix(".") {
     id.removeLast()
 }
