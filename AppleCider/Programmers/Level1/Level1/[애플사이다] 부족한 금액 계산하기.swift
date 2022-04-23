import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var totalPrice = 0
    for index in 1...count {
        totalPrice += price * index
    }

    var balance = money - totalPrice
    return balance >= 0 ? Int64(0) : Int64(-balance)
}

// 개선
// 고차함수 활용
func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
        var totalPrice = (1...count).reduce(0) { $0 + price * $1 }
    // var totalPrice = [1...count].reduce(0) { $0 + price * $1 } // (...) 대신 [...]은 range 타입이라서 안됨

    var balance = money - totalPrice
    return balance >= 0 ? Int64(0) : Int64(-balance)
}

// 개선
// max 활용
func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
        var totalPrice = (1...count).reduce(0) { $0 + price * $1 }

    return max(Int64(0), Int64(totalPrice - money))
}

// 공식 활용
// let totalPrice = price * n(n+1)/2
func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let totalPrice = price * count * (count + 1) / 2

    return max(Int64(0), Int64(totalPrice - money))
}
