//
//  FinalPricesWithASpecialDiscountInAShop.swift
//  LeetCode
//
//  Created by 양호준 on 2022/01/17.
//

import Foundation

class SolutionStackC {
    func finalPrices(_ prices: [Int]) -> [Int] {
        var temp = prices
        temp.append(0) // 마지막에 할인 금액이 없을 경우 그대로 값이 나오기 위해 넣음.
        var result = [Int]() // 할인 후 총 배열
        var discount: Int // 할인 금액
        var discounted = 0 // 할인된 금액
        var originPrice = temp.removeFirst() // 8
        
        while result.count != prices.count {
            for price in temp {
                if originPrice >= price { // 할인할 수 있는 금액
                    discount = price
                    discounted = originPrice - discount
                    result.append(discounted)
                    originPrice = temp.removeFirst()
                    break // 위 코드가 실행되었으면 다음 element에 접근할 필요없이 반복문 종료
                }
            }
        }
        return result
    }
}
