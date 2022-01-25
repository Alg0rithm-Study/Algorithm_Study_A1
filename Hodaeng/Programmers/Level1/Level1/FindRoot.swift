//
//  FindRoot.swift
//  Level1
//
//  Created by 양호준 on 2022/01/25.
//

import Foundation

func solution(_ n:Int64) -> Int64 {
    let numToDouble = Double(n)
    let squareRootResult = numToDouble.squareRoot()
    let intInspector: Bool = squareRootResult - squareRootResult.rounded() == 0
    guard intInspector == true else {
        return -1
    }
    let newValue = (squareRootResult + 1) * (squareRootResult + 1)
    return Int64(newValue)
}

