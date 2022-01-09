//
//  HashadNumber.swift
//  Level1
//
//  Created by 양호준 on 2022/01/09.
//

import Foundation

func solution(_ x:Int) -> Bool {
    var hashad: Bool = true
    let singleDigit: Int = x % 10
    let doubleDigit: Int = x % 100
    let tripleDigit: Int = x % 1000
    let fourDigit: Int = x % 10000
    
    let firstNumber = singleDigit
    let secondNumber = (doubleDigit - singleDigit) / 10
    let thirdNumber = (tripleDigit - doubleDigit) / 100
    let fourthNumber = (fourDigit - tripleDigit) / 1000
    
    let sum = firstNumber + secondNumber + thirdNumber + fourthNumber
    
    if x % sum == 0 {
        hashad = true
    } else {
        hashad = false
    }
    
    return hashad
}
