import Foundation

extension RandomAccessCollection where Element: Comparable {
    func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
                // 검색 대상인 range가 유효한지 확인
        let range = range ?? startIndex..<endIndex // 매개변수로 안 주어졌으면
        guard range.lowerBound < range.upperBound else { // empty이면 lower==upper
            return nil
        }
        
                // 1. 정중앙을 확인함
        let size = distance(from: range.lowerBound, to: range.upperBound)
        let middle = index(range.lowerBound, offsetBy: size / 2)

                // 2. 정중앙과 찾는 값이 일치하면 반환
        if self[middle] == value {
            return middle
        } else if self[middle] > value { // 3. 정중앙이 찾는 값보다 크면 큰 반쪽은 버림 (작으면 반대로)
            return binarySearch(for: value, in: range.lowerBound..<middle)
        } else {
            return binarySearch(for: value, in: index(after: middle)..<range.upperBound)
        }
    }
}

// Tests
import XCTest
@testable import DataStructures

final class BinarySearchTestCase: XCTestCase {
      func test_binarySearch() {
            let array = [1, 5, 18, 32, 33, 33, 47, 49, 502]
            XCTAssertEqual(array.binarySearch(for: 5), 1)
      }
}
