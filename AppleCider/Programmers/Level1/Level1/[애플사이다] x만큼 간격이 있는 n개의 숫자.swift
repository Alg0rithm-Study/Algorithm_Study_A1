func solution(_ x:Int, _ n:Int) -> [Int64] {
    var result: [Int64] = []

    for index in 1...n {
        result.append(Int64(x * index))
    }
    return result
}

// 다른 답변
func solution(_ x:Int, _ n:Int) -> [Int64] {
    return Array(1...n).map { Int64($0 * x) }
}
