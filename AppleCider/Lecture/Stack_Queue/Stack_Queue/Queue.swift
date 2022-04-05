import Foundation

protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

struct QueueArray<T>: Queue {
    private var array: [T] = []
    var isEmpty: Bool {
        return array.isEmpty
    }
    var peek: T? {
        return array.first
    }
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {  // O(n)
        return isEmpty ? nil : array.removeFirst()
    }
}

// Double Stack Queue
struct QueueStack<T>: Queue {
    private var dequeueStack: [T] = []
    private var enqueueStack: [T] = []
    var isEmpty: Bool {
        return dequeueStack.isEmpty && enqueueStack.isEmpty
    }
    var peek: T? {
        return !dequeueStack.isEmpty ? dequeueStack.last : enqueueStack.first
    }
    
    mutating func enqueue(_ element: T) {
        enqueueStack.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {  // O(1)로 개선
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()  // reversed 메서드가 O(1)임을 이용
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}
