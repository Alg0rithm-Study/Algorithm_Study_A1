import Foundation

// 풀이
// 각 row별로 force를 구하고
// index를 정렬하고
// k개수만큼 SubArray를 구하여 반환
func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
    let forces = mat.map { peopleInRow in
        peopleInRow.reduce(0, +)
    }
    
    var resultWithIndex: [Int: Int] = [:]
    
    for (index, force) in forces.enumerated() {
        resultWithIndex[index] = force
    }
    
    let array = resultWithIndex.sorted { $0.value == $1.value ? $0.key < $1.key : $0.value < $1.value }.map { $0.key }
    
    return Array(array[0..<k])  // Array로 타입캐스팅하지 않으면 subscript 사용 불가
}
// 딕셔너리는 $0.key < $1.key 처리를 하지 않으면 틀렸다고 나오고
// 튜플은 처리 안해도 정답이 나옴
// 딕셔너리는 순서가 없고, 튜플은 순서가 있어서 그런듯
