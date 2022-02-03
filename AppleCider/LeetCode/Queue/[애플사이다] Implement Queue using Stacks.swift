import Foundation

class MyQueue {
    var leftStack: [Int] = []
    var rightStack: [Int] = []
    
    init() {
    }
    
    func push(_ x: Int) {
        rightStack.append(x)
    }
    
    func pop() -> Int {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
//        return leftStack.popLast()!  // O(1) - 반환타입이 옵셔널
        return leftStack.removeLast()  // O(1) - 빈 배열이면 안됨을 전제로 함
    }
    
    func peek() -> Int {
        return leftStack.isEmpty ? rightStack.first! : leftStack.last!
//        if leftStack.isEmpty {   // 불필요함
//            leftStack = rightStack.reversed()
//            rightStack.removeAll()
//        }
//        return leftStack.last!
    }
    
    func empty() -> Bool {
                return leftStack.isEmpty && rightStack.isEmpty  // (3 ms, faster than 53.19%)
//        if leftStack.isEmpty && rightStack.isEmpty {  // 위와 동일함 (0 ms, faster than 100.00%)
//            return true
//        }
//        return false
    }
}
/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */

// 풀이
// 2개의 Stack (배열)로 Queue를 만듦
// 배열의 마지막 요소를 제거하는 연산은 재정렬이 필요 없으므로 시간복잡도가 O(1)임을 활용함
// enqueue는 right stack에만 하고, dequeue는 left stack에서만 함
// dequeue할 때 right stack을 reversed해서 left stack에 옮기고, left stack의 마지막 요소를 꺼냄
// faster than 100.00% of Swift online submissions


// 참고 - reversed를 사용할 수 없다면 (문제 조건)
    func pop() -> Int {
        if leftStack.isEmpty {
                        while !rightStack.isEmpty {
                                let removed = rightStack.removeLast()
                                leftStack.append(removed)
                        }
        }

        return leftStack.removeLast()
    }
