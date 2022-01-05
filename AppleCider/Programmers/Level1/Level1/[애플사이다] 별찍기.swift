import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])

func printRowStar(of count: Int) {
    for _ in 0..<a {  // (0..<a).forEach {...} 형태도 가능하지만
        print("*", terminator: "")
    }
}

func repeatPrint(of count: Int) {
    for _ in 0..<b {
        printRowStar(of: a)
        print("\n", terminator: "")
    }
}

repeatPrint(of: b)

// 다른 답변 개선
for _ in 0..<b {
    print(String(repeating: "*", count: a))
}

// 다른 답변
for _ in 0..<b {
    print(Array(repeating: "*", count: a).joined())
}
