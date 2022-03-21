import Foundation


class SolutionBinarySearchB {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var counts = [Int]() // 1의 갯수를 세어 모아두는 Array
        var result = [Int]() // 정렬된 counts를 원래 배열에서 어떤 index에 있었는지 모아두는 Array
        
        mat.forEach { array in // Int array로 벗기고
            let sortedArray = array.sorted() // 이를 sort해서
            if sortedArray.contains(1) { // 1이 있으면 갯수를 센다.
                guard let index = sortedArray.firstIndex(of: 1) else {
                    return
                } // 1이 처음 나오는 index를 세면 0 갯수
                let count = array.count - index // 전체에서 빼면 1의 갯수
                
                counts.append(count) // Array에 1의 갯수를 넣어준다.
            } else {
                counts.append(0) // 만약 1이 없을 경우 0을 바로 넣어준다.
            }
        }

        // 정렬해서 가장 첫 index
        var originCounts = counts // [2, 4, 1, 2, 5] // 기존 counts를 모아두기 위해 밑에 둠.
        
        for element in counts.sorted() { //  -> 1, 2, 2, 4, 5
            guard let index = originCounts.firstIndex(of: element) else { return [] } // 정렬된 가장 첫번째 값부터 검증을 해서 기존 counts에서 어디에 있었는지를 판단
            originCounts[index] = -1 // 요소가 겹치는 문제가 있어 아예 나올 수 없는 음수로 변경하여 중복되는 값이 있어도 가장 첫번째 인덱스를 안 뒤 값을 변경해주어 다음 요소를 찾아도 문제 없도록 함.
            
            result.append(index) // 찾은 인덱스를 넣어줌.
        }
        
        return Array(result[0..<k]) // subscript들을 다시 Array로 변환해 반환
    }
}
