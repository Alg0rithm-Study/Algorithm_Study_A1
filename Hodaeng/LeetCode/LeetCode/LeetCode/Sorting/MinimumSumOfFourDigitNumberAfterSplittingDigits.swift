//
//  MinimumSumOfFourDigitNumberAfterSplittingDigits.swift
//  LeetCode
//
//  Created by 양호준 on 2022/02/20.
//

import Foundation

// 4자리 숫자를 2개의 요소로 가진 배열로 정렬하여 요소의 합이 최소화되도록 하는 문제
// 해결책: 각 요소의 10의 자리에 가장 작은 수를 넣어준다.

/*
 굳이 배열로 나와서 요소를 더해줄 필요는 없을 것 같다.
 가장 작은 수를 뽑아낸 다음 1, 3째 자리에 넣어주고 더해주면 될듯?
 */

class SolutionSortA  {
    func minimumSum(_ num: Int) -> Int {
        let numAsString = String(num)
        var digits = numAsString.compactMap { $0.wholeNumberValue } // 각 자리의 숫자를 배열로 바꿈.
        // wholeNumberValue의 경우 만약 숫자로 표현할 수 있다면 문제가 나타낼 수 있는 숫자로 바꿔줌 (옵셔널 리턴해줘서 compactMap 사용)
        
        // 사실 배열에 sorted 메서드쓰면 엄청 간단하게 가능. 
        for currentIndex in 1..<digits.count { // Insertion Sort를 사용하기 위해 2번째 요소부터 끝가지 반복문을 돌림
            for comparedIndex in (1...currentIndex).reversed() { // 현재 비교하고 있는 요소부터 처음까지 비교를 할 수 있도록 reversed를 통해 범위를 뒤집어서 반복문 돌림
                if digits[comparedIndex] < digits[comparedIndex - 1] { // 현재 값과 그 이전의 값을 비교해 이전 값이 크면
                    digits.swapAt(comparedIndex, comparedIndex - 1) // 그 값과 바꿈
                } else {
                    break // 작으면 현재 반복 종료
                }
            }
        }
        digits.swapAt(1, 2) // 지금은 [1 3 2 4] 순서대로 정렬을 해줘야 가장 작은 수를 찾을 수 있다. 생각해보니 밑에 처럼 계산하면 굳이 필요 없긴 함.
        
        let tenDigit = (digits[0] + digits[2]) * 10 // 10의 자리끼리 더해서 미리 계산해줌
        let unitDigit = (digits[1] + digits[3]) // 1의 자리 더해줌
        
        return tenDigit + unitDigit // 2개를 더하면 계산 완료~~
    }
}
