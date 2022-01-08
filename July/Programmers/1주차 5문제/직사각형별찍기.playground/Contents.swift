import Foundation

//x만큼 더해지는 n 개의 수
//func solution(_ x:Int, _ n:Int) -> [Int64] {
//    (0..<n).map { Int64(x + ( x * $0)) }
//}


////행렬의 덧셈
//func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
//    var initialNumbers: [[Int]] = []
//
//    (0..<arr1.count).forEach { number in
//        let eachNumbers = (0..<arr1[0].count).map { arr1[number][$0] + arr2[number][$0] }
//        initialNumbers.append(eachNumbers)
//    }
//
//    return initialNumbers
//}
//
//let a = solution([[1,2],[3,4]], [[1,2],[3,4]])
//print(a)
//
//func solution(_ phone_number:String) -> String {
//    Array(phone_number).reversed().filter { $0 }
//}

// 하샤드 수

//func solution(_ x:Int) -> Bool {
//    let converted = String(x)
//    let each = Array(converted)
//    let numbers = each.compactMap { Int($0) }
//    let sum = numbers.reduce { 0;, + }
//}
//
//solution(10)


//func solution(_ x:Int) -> Bool {
//    let a = Array(String(x))
//    let b = a.map { String($0) }
//    let c = b.compactMap { Int($0) }
//    let d = c.reduce(0,+)
//    return x % d == 0 ? true : false
//}
//
//solution(10)

func solution(_ phone_number:String) -> String {
    String(repeating: "*", count: phone_number.count - 4) + phone_number.suffix(4)
}

let a = solution("01033334444")
let b = solution("027778888")
print(a)
print(type(of: a))
print(type(of: b))
