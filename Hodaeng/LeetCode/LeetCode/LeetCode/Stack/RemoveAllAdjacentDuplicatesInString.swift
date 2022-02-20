//
//  RemoveAllAdjacentDuplicatesInString.swift
//  LeetCode
//
//  Created by 양호준 on 2022/01/18.
//

import Foundation

class SolutionStackD {
    func removeDuplicates(_ s: String) -> String {
        var stack = [Character]() // 새로운 값을 넣을 배열
        
        for character in s {
            if let lastStack = stack.last, lastStack == character { // 처음엔 무조건 없어서 추가함.
                stack.removeLast() // a,b가 들어와 있는 상황에서 동일할 마지막과 동일할 경우 중복이기때문에 마지막을 삭제
            } else {
                stack.append(character)
            }
        }
        return String(stack)
    }
}
