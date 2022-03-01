import Foundation

struct Stack<Element: Equatable>: Equatable {  // Stack 인스턴스끼리 비교할 수 있게 함
  private var storage: [Element] = []
  var isEmpty: Bool {
    return peek() == nil
  }
  
  init() { }
  
  init(_ elements: [Element]) {  // 여러 Array 요소를 할당하여 init 가능하도록 추가
    storage = elements
  }
 
  func peek() -> Element? {
    return storage.last
  }
  
  mutating func push(_ element: Element) {
    storage.append(element)
  }
  
  @discardableResult
  mutating func pop() -> Element? {
    return storage.popLast()
  }
}

extension Stack: CustomStringConvertible {
  var description: String {  // 디버깅 시 확인이 용이하도록 함
    return storage
    .map { "\($0)"}
    .joined(separator: " ")
  }
}

extension Stack: ExpressibleByArrayLiteral {  // 자동으로 아래 stub을 추가해줌, Literal로 init 가능하도록 추가
  init(arrayLiteral elements: Element...) {
    storage = elements  // 가변 매개변수는 Array처럼 취급됨
  }
}
