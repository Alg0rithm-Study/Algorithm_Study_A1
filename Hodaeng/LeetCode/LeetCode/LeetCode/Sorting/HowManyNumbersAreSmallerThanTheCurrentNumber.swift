//
//  HowManyNumbersAreSmallerThanTheCurrentNumber.swift
//  LeetCode
//
//  Created by 양호준 on 2022/02/21.
//

import Foundation

// 런타임 53초 메모리 사용 14.2mb
// sorted된 값의 인덱스가 곧 자신보다 작은 수의 갯수라고 생각됐지만 중복되는 값을 처리할 방법을 찾지 못함.

// 1번 풀이 -> sort를 쓰지 않아도 충분히 해결되는 풀이 따라서 올바르지 않다고 판단
class SolutionSortB {
    func smallerNumbersThanCurrent1(_ nums: [Int]) -> [Int] {
        let sortedNumbers = nums.sorted() // 일단 값을 오름차순으로 정렬
        var result: [Int] = [] // 각각 작은 수의 갯수를 담는 배열 생성
        
        for index in 0..<nums.count { // 기존 nums를 전부 돌아야 하기 때문에 이렇게 반복문 돈다.
            var count = 0 // 갯수를 세기 위한 변수
            sortedNumbers.forEach { number in // 정렬된 값의 처음부터 끝까지를 비교하는 반복문.
                if nums[index] > number { // 인덱스 별로 자신보다 작은수를 검증
                    count += 1 // 맞으면 카운트 올림
                }
            }
            result.append(count)
        }
        
        return result
    }
    
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        let sortedNumbers = nums.sorted() // 오름차순으로 정렬
        var result: [Int] = []
        
        for index in 0..<nums.count { // 처음부터 끝까지 돌 수 있도록 반복문 설정
            let firstCount = sortedNumbers.firstIndex(of: nums[index])! // firstIndex를 통해 기존의 값이 어느 인덱스에 있는지 파악 -> 중복되는 값이 있더라도 해당 수가 가장 처음 있는 인덱스를 찾기 때문에 중복되는 수도 해결 가능
            result.append(firstCount)
        }
        
        return result
    }
}
// 원래 수 8 1 2 2 3
// 1 2 2 3 8

// 8은 인덱스 4에 위치 이는 곧 앞에 작은 수가 얼마나 있는지를 의미 -> 이런 식으로 찾음. 

