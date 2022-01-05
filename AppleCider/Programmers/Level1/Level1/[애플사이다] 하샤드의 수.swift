import Foundation

func solution(_ x:Int) -> Bool {
    var sum: Int = 0
    
    for number in String(x) {  // String을 for문 돌리면 Character 1개씩 iteration
        let number = Int(String(number))!  // Character -> String으로 변환
        sum += number
    }
    
    return x % sum == 0
}
// String은 for문을 돌려서 Character에 접근이 가능함을 이용했다. Int 타입의 숫자를 String으로 변환하여 for문을 돌렸다.

// 다른 답변
func solution(_ x:Int) -> Bool {
    var sum = String(x)
        .map { Int(String($0))! }  // String도 map을 쓸 수 있음. for문이 되는 것처럼
        .reduce(0, +)

    return x % sum == 0
}

// 다른 답변
func solution(_ x:Int) -> Bool {
    return x % String(x).reduce(0, { $0 + Int(String($1))! }) == 0
}
