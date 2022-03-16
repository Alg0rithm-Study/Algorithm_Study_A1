import Foundation

class BinaryNode<Element> {
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(value: Element) {
        self.value = value
    }
}
//let zero = BinaryNode(value: 0)
//let one = BinaryNode(value: 1)
//let five = BinaryNode(value: 5)
//one.leftChild = zero
//one.rightChild = five

extension BinaryNode {
    // 1. leftChild가 있다면 해당 Node를 visit (재귀)
    // 2. 없다면 자기자신을 visit
    // 3. rightChild가 있다면 해당 Node를 visit (재귀)
    func traverseInOrder(visit: (Element) -> Void) {
        // 3개 Node가 있을 때 leftChild, parent, rightChild 순으로 visit
        leftChild?.traverseInOrder(visit: visit)
        visit(value)  // 위의 재귀함수가 끝나면 이때 Parent Node로 올라와짐
        rightChild?.traverseInOrder(visit: visit)
    }
    
    func traversePreOrder(visit: (Element) -> Void) {
        // 3개 Node가 있을 때 parent, leftChild, rightChild 순으로 visit
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    func traversePostOrder(visit: (Element) -> Void) {
        // 3개 Node가 있을 때 leftChild, rightChild, parent 순으로 visit
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}
//func test_traverseInOrder() {
//  var testArray: [Int] = []
//  tree.traverseInOrder { testArray.append($0) }
//  XCTAssertEqual(testArray, [0, 1, 5, 7, 8, 9])
//}

// For Serialization
extension BinaryNode {
    func traversePreOrderWithNil(visit: (Element?) -> Void) {
        // 3개 Node가 있을 때 parent, leftChild, rightChild 순으로 visit
        visit(value)
        
        if let leftChild = leftChild {
            leftChild.traversePreOrderWithNil(visit: visit)
        } else {
            visit(nil)
        }
        
        if let rightChild = rightChild {
            rightChild.traversePreOrderWithNil(visit: visit)
        } else {
            visit(nil)
        }
    }
}

// 출력문으로 Tree 구조를 시각화하는 기능
extension BinaryNode: CustomStringConvertible {
  //Note: This algorithm is based on an implementation by Károly Lőrentey in his book Optimizing Collections, available from https://www.objc.io/books/optimizing-collections/.
  
  public var description: String {
    return diagram(for: self)
  }
  
  private func diagram(for node: BinaryNode?,
                       _ top: String = "",
                       _ root: String = "",
                       _ bottom: String = "") -> String {
    guard let node = node else {
      return root + "nil\n"
    }
    if node.leftChild == nil && node.rightChild == nil {
      return root + "\(node.value)\n"
    }
    return diagram(for: node.rightChild,
                   top + " ", top + "┌──", top + "│ ")
      + root + "\(node.value)\n"
      + diagram(for: node.leftChild,
                bottom + "│ ", bottom + "└──", bottom + " ")
  }
}
