import Foundation

func mergeSort<Element: Comparable>(_ array: [Element]) -> [Element] {
    // 1. split
    guard array.count > 1 else {  // 더 이상 split이 불가할 때 반환함
        return array // 1개가 남았을 때를 base case라고 부름
    }
    let middle = array.count / 2
    let left = mergeSort(Array(array[..<middle]))  // 재귀함수 (더 이상 split이 불가할 때까지 쪼갬)
    let right = mergeSort(Array(array[middle...]))
    
    // 2. merge
    return merge(left, right)
}

func merge<Element: Comparable>(_ left: [Element], _ right: [Element]) -> [Element] {
    var leftIndex = 0
    var rightIndex = 0
    var result: [Element] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            result.append(rightElement)
            rightIndex += 1
        } else {
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
    }
    
    // 비교하다가 한 쪽 Array 요소들을 모두 써버렸다면, 남은 쪽의 요소는 이미 정렬되어 있으므로! 그냥 append하면 됨
    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    }
    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }
    return result
}

// 테스트
import XCTest

final class SortingTestCase: XCTestCase {
    var testArray = [7, 2, 6, 3, 3, 9, 15, 4, 11]
    let sortedArray = [2, 3, 3, 4, 6, 7, 9, 11, 15]
    
    func test() {
        XCTAssertEqual(mergeSort(testArray), sortedArray)
    }
}
