import Foundation

struct Heap<Element: Equatable> {  // Array와 대응시켜야 하므로 Equatable을 준수해야 함
    private var elements: [Element] = []
    let areSorted: (Element, Element) -> Bool  // min/max heap을 구분하기 위함
    
    init(_ elements: [Element], areSorted: @escaping (Element, Element) -> Bool) {
        self.areSorted = areSorted
        self.elements = elements
        
        guard !elements.isEmpty else { return }
        for index in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
            siftDown(from: index)
        }
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    var count: Int {
        return elements.count
    }
    
    func getChildIndices(ofParentAt parentIndex: Int) -> (left: Int, right: Int) {
        let leftIndex = (2 * parentIndex) + 1  // 그림 참고
        return (leftIndex, leftIndex + 1)
    }
    func getParentIndex(ofChildAt index: Int) -> Int {
        return (index - 1) / 2  // leftIndex 구하는 로직을 거꾸로
    }
    
    mutating func removeRoot() -> Element? {
        guard !isEmpty else { return nil }
        
        elements.swapAt(0, count - 1)  // 1. root node <-> 마지막 node를 바꿈
        let originalRoot = elements.removeLast()  // 2. 마지막 node (원래는 root)를 삭제
        siftDown(from: 0)  // 3. node 삭제 반영하여 재정렬
        
        return originalRoot
    }
    
    // Heap invariant 구현 - Min/Max Heap으로 재정렬하는 함수
    // 매개변수로 받은 parent node를 통해 sift를 진행하고,
    // 전체 level을 iterate하여 child index를 구함
    mutating func siftDown(from index: Int) {
        var parentIndex = index
        
        while true {
            let (leftIndex, rightIndex) = getChildIndices(ofParentAt: parentIndex)
            var optionalParentSwapIndex: Int?  // 필요 시 child와 swap해야 하므로 변수에 저장
            
            // left > parent라면 바꿈!! (원래는 Max Heap이니까 parent > left 여야 함)
            if leftIndex < count
                && areSorted(elements[leftIndex], elements[parentIndex]) {
                optionalParentSwapIndex = leftIndex
            }
            if rightIndex < count  // right는 left, parent 순으로 비교
                && areSorted(elements[rightIndex], elements[optionalParentSwapIndex ?? parentIndex]) {
                optionalParentSwapIndex = rightIndex
            }
            guard let parentSwapIndex = optionalParentSwapIndex else { return }
            elements.swapAt(parentIndex, parentSwapIndex)  // 값 바꿈
            parentIndex = parentSwapIndex  // index 바꿈
        }
    }
}

// 테스트
import XCTest

final class HeapTestCase: XCTestCase {
        private let unsortedInts = [1, 12, 3, 4, 1, 6, 8, 7]  // root는 12

      func test_removeRoot() {
            var heap = Heap(unsortedInts, areSorted: >)  // > 함수이니까 Max Heap (큰 수가 index 0이라서)
            XCTAssertEqual(heap.removeRoot(), 12)
      }
}
