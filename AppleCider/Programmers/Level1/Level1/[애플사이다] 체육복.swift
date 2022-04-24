import Foundation

// 문제 내용
// 여벌의 체육복이 있는 학생 (reserve)은 도난당한 학생 (lost)에게 빌려줌
// 번호는 +1, -1에게만 전달 가능함
// 체육복을 가지는 학생수의 최댓값을 구해야 함

// 풀이
// 여벌의 체육복이 있는 학생을 for문으로 iterate함
// 앞사람이 체육복이 없으면 빌려주고, 뒷사람이 체육복이 없으면 빌려줌
func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    // 여벌 체육복을 가져온 학생이 체육복을 도난당한 경우, lost도 아니고 reserve도 아님
    let reserves = Set(reserve).subtracting(lost)
    var losts = Set(lost).subtracting(reserve)
    
    // 문제오류 - reserve+1 및 reserve-1 순서를 바꾸면 실패함
    for reserve in reserves.sorted() {   // 정렬되지 않은 상태의 reserve인 테스트 케이스가 있음
        if losts.contains(reserve - 1) { // 2번->1번에게 전달, 0번 학생은 없음
            losts.remove(reserve - 1)
        } else if losts.contains(reserve + 1) {
            losts.remove(reserve + 1)
        }
    }
    
    return n - losts.count
}
// 17,18 케이스 실패 : 뒷사람->앞사람에게 빌려줘야 테스트케이스를 통과함 -> 문제 오류인듯
// 12,13 케이스 실패 : 정렬되지 않은 상태의 reserve인 테스트 케이스가 있음
