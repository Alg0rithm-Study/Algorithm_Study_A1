import Foundation

func bubbleSort<Element: Comparable>(_ array: inout [Element]) {
    // There is no need to sort the collection if it has less than two elements.
    guard array.count >= 2 else {
        return
    }
    // A single-pass bubbles the largest value to the end of the collection.
    //Every pass needs to compare one less value than in the previous pass, so you essentially shorten the array by one with each pass.
    for end in (1..<array.count).reversed() {
        var swapped = false
        // This loop performs a single pass; it compares adjacent values and swaps them if needed.
        for current in 0..<end {
            if array[current] > array[current + 1] {
                array.swapAt(current, current + 1)  // Array 메서드 - 매개변수의 두 index의 요소를 swap
                swapped = true
            }
        }
        //If no values were swapped this pass, the collection must be sorted, and you can exit early.
        if !swapped {
            return
        }
    }
}

func selectionSort<Element: Comparable>(_ array: inout [Element]) {
    guard array.count >= 2 else {
        return
    }
    
    for current in 0..<(array.count - 1) {
        var lowest = current
        
        for other in (current + 1)..<array.count {
            if array[lowest] > array[other] {
                lowest = other
            }
        }
        if lowest != current {
            array.swapAt(lowest, current)
        }
    }
}

func insertionSort<Element: Comparable>(_ array: inout [Element]) {
    guard array.count >= 2 else {
        return
    }
    
    for current in 1..<array.count {
        for shifting in (1...current).reversed() {
            if array[shifting] < array[shifting - 1] {  // 바로 왼쪽 요소와 비교&swap
                array.swapAt(shifting, shifting - 1)
            } else {
                break  // 바로 왼쪽이 더 작으면 바로 for문을 종료
            }
        }
    }
}

// 테스트 코드
import XCTest
@testable import DataStructures

final class SortingTestCase: XCTestCase {
    var testArray: [Int] = []
    let sortedArray = [3, 4, 9, 10]
    
    override func setUp() {
        testArray = [9, 4, 10, 3]
    }
    
    func test_bubbleSort() {
        bubbleSort(&testArray)
        XCTAssertEqual(testArray, sortedArray)
    }
    
    func test_selectionSort() {
        selectionSort(&testArray)
        XCTAssertEqual(testArray, sortedArray)
    }
    
    func test_insertionSort() {
        insertionSort(&testArray)
        XCTAssertEqual(testArray, sortedArray)
    }
}
