import Foundation


class SolutionBinarySearchA {
    func countNegatives(_ grid: [[Int]]) -> Int {
        let flattedGrid = grid.flatMap { $0 } // 2차원 배열 풀기 위해 flatmap 써주고
        let sortedGrid = flattedGrid.sorted() // 정렬을 해준다.
        
        for (index, element) in sortedGrid.enumerated() { // 그리고 index, element를 빼주기 위해 enumerated() 메서드 사용
            if element >= 0 { // 반복문 처음부터 돌면서 element가 0보다 크거나 같아지면 더이상 뒤는 볼 필요없이 이전 요소가 마지막 음수
                return index // 0부터 시작하기 때문에 index번째 요소가 마지막 음수라서 index 반환
            } else if element < 0, sortedGrid.count == 1 { // 만약 배열 요소가 1개인데 음수라면 0이 반환된다. 그래서 이 경우를 조건으로
                return 1 // 1을 반환한다.
            }
        }
        
        return 0 // 반복문 다 돌았는데도 위 리턴을 안타면 음수가 없는거라 0 반환 사실 음수없는지 확인하는 가장 좋은 방법은 정렬 후 [0]이 음수가 아닌지 확인하는게... 가장 좋을 것 같다.
    }
}
