//
//  drawSquare.swift
//  Level1
//
//  Created by 양호준 on 2022/01/09.
//

import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])

var string = ""

for _ in 1...a {
    string = string + "*"
}

for _ in 1...b {
    print(string)
}
