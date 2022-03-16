import XCTest
@testable import DataStructures

// 여기는 왜 그냥 함수가 올수있지???
// Add Serialize Function
func serialize<Element>(rootNode: BinaryNode<Element>) -> [Element?] {
    // 3개 Node가 있을 때 parent, leftChild, rightChild 순으로 visit
    var result: [Element?] = []
    rootNode.traversePreOrderWithNil { result.append($0) }
    return result
}
// Space Complexity : O(n)

// Add Deserialize Function
func deserialize1<Element>(array: inout [Element?]) -> BinaryNode<Element>? {
    // PreOrder 방식으로 serialize 했으므로
    // 해당 방식으로 "tree를 visit하는 대신 Tree Node를 생성하면 됨"
    guard let value = array.removeFirst() else { // inout 매개변수라서 removeFirst 가능 (원래는 매개변수인 array 상수 취급)
        return nil
    }
    
    let node = BinaryNode(value: value)
    node.leftChild = deserialize1(array: &array) // array가 계속 업데이트되므로 가능함
    node.rightChild = deserialize1(array: &array)
    
    return node
}
// Element 개수만큼 배열의 첫번째 요소를 제거하므로 Time Complexity : O(n2)
// 아래처럼 리팩토링할 수 있음 (배열을 뒤집어서 removeLast하는 방법)

func deserialize2<Element>(array: inout [Element?]) -> BinaryNode<Element>? {
    guard let value = array.removeLast() else {
        return nil
    }
    
    let node = BinaryNode(value: value)
    node.leftChild = deserialize2(array: &array) // array가 계속 업데이트되므로 가능함
    node.rightChild = deserialize2(array: &array)
    
    return node
}
func reverseAndDeserialize2<Element>(array: [Element?]) -> BinaryNode<Element>? {
    var reversed = Array(array.reversed()) // ReversedCollection<[Element?]>이 되므로 다시 Array로 타입 변환
    return deserialize2(array: &reversed)
}
// Time Complexity : O(n)으로 개선됨
// Space Complexity : O(n)


final class BinaryTreeTestCase: XCTestCase {
    var tree: BinaryNode<Int> = {
        let zero = BinaryNode(value: 0)
        let one = BinaryNode(value: 1)
        let five = BinaryNode(value: 5)
        let seven = BinaryNode(value: 7)
        let eight = BinaryNode(value: 8)
        let nine = BinaryNode(value: 9)
        
        seven.leftChild = one
        one.leftChild = zero
        one.rightChild = five
        seven.rightChild = nine
        nine.leftChild = eight
        
        return seven
    }()
    
    func test_serialize_and_deserialize() {
        let expectedArray = [7, 1, 0, nil, nil, 5, nil, nil, 9, 8, nil, nil, nil]
        
        let serializedTree = serialize(rootNode: tree) // serialize
        XCTAssertEqual(serializedTree, expectedArray)
        
        let deserializedArray = reverseAndDeserialize2(array: serializedTree) // deserialize
        XCTAssertEqual(deserializedArray?.description, tree.description)
    }
}
