import Foundation

class Solution {
    func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
        let minimumTurns = tickets[k]  // [1,3,2], k=2인 경우 최소 2번 turn을 돌아야 함
        var result: Int = 0
        
        for number in tickets {
            result += min(number, minimumTurns)  // 아래와 동일함
//            if number < minimumTurns {
//                result += number
//            } else {
//                result += minimumTurns
//            }
        }
        
        if tickets.count > k+1 {  // [1,2], k=0인 경우 1번 turn이 끝난 후 index 1의 1초를 제외시켜야 함
            for number in tickets[k+1...tickets.count-1] {
                if number >= minimumTurns {
                    result -= 1
                }
            }
        }
        
        return result
    }
}
// 문제 해석
// 배열의 i번째 요소는 i번째 사람이 구매하려는 티켓의 개수임
// 1명이 1개 티켓을 구매하는 데 1초가 소요되며
// 한 번 줄을 섰을 때 티켓을 1장씩만 구매할 수 있음

// 풀이
// 최소 줄을 서야하는 횟수는 tickets[k]임
// tickets 배열을 for문을 돌려서
// "각 요소의 값 (= 원하는 티켓 개수)" 또는 "minimumTurns" 중에서 최소값을 소요시간 (result)에 더함
// 이때, k번째 index의 값이 0이 되는 순간까지의 소요시간을 구해야 하므로
// k번째 이후의 index가 minimumTurns 이상이면 소요시간에서 제외시킴


// 다른 풀이
func timeRequiredToBuy2(_ tickets: [Int], _ k: Int) -> Int {
    var array = tickets
    var answer = 0
    var ticketsLeft = tickets[k]
    
    while ticketsLeft > 0 {
        for i in 0..<tickets.count {  // 배열의 개수를 통해 배열의 각 요소에 접근함
            if array[i] > 0 {
                answer += 1
                array[i] -= 1  // turn마다 각 요소의 값을 -1 시킴
                if i == k {
                    ticketsLeft -= 1
                    if ticketsLeft == 0 {  // k번째의 남은 티켓 개수가 0이 되면, 소요시간을 반환함
                        return answer
                    }
                }
            }
        }
    }
    
    return answer
}

// 다른 풀이
func timeRequiredToBuy3(_ tickets: [Int], _ k: Int) -> Int {
        tickets.enumerated().reduce(0) { $0 + min($1.element, $1.offset > k ? tickets[k] - 1 : tickets[k]) }
}
