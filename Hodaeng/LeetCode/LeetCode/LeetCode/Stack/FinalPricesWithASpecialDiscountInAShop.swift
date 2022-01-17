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
        temp.append(0)
        var result = [Int]()
        var discount: Int
        var discounted = 0
        var originPrice = temp.removeFirst()
        
        while result.count != prices.count {
            for price in temp {
                if originPrice >= price {
                    discount = price
                    discounted = originPrice - discount
                    result.append(discounted)
                    originPrice = temp.removeFirst()
                    break
                }
            }
        }
        return result
    }
}
