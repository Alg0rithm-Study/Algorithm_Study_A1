import Foundation

class RecentCounter {
    var requests: [Int] = []
    
    init() {
    }
    
    func ping(_ t: Int) -> Int {
        requests.append(t)
        let range = t - 3000...t
        
        return requests.filter { range.contains($0) }.count
    }
}
/**
 * Your RecentCounter object will be instantiated and called as such:
 * let obj = RecentCounter()
 * let ret_1: Int = obj.ping(t)
 */

// 풀이
// ping 함수를 여러 번 호출하는데, 우선 역대 전달인자 t들을 저장하는 배열이 있다.
// 그리고 가장 최근에 전달된 t를 기준으로 t - 3000...t라는 범위를 만든 뒤, 해당 범위 내에 속하는 배열 요소의 개수를 구해야 한다.

// 다른 풀이
// Queue 타입을 구현하여 사용했음
class Queue<T> {  // 더블 스택 큐
    private var leftStack: [T]
    private var rightStack: [T]
    
    init () {
        leftStack = []
        rightStack = []
    }
    
    func enqueue(_ element: T) {
                rightStack.append(element)
        }
    
    @discardableResult
    func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()  // Swift에서 reversed의 시간복잡도는 O(1)
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
    
    func peek() -> T? {
        !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    var count: Int {
                leftStack.count + rightStack.count
        }
}

class RecentCounter {
    var queue: Queue<Int>
    
        init() {
                queue = Queue<Int>()
        }
    
    func ping(_ t: Int) -> Int {
        queue.enqueue(t)
        
        while queue.peek()! < t - 3000 {  // queue 요소가 t - 3000...t 범위에 속하지 않으면 dequeue 시킴
            queue.dequeue()
        }

        return queue.count
    }
}

// 다른 풀이
// 위와 동일함
class RecentCounter {
    var reqa : [Int] = []
    init() {
    }
    
    func ping(_ t: Int) -> Int {
        reqa.append(t)

        while reqa[0] < t - 3000 {
            reqa.removeFirst()
        }

        return reqa.count
    }
}
