import Foundation

func finalPrices(_ prices: [Int]) -> [Int] {
    var finalPrice: [Int] = []
    let count = prices.count
    
    for index in 0..<count {
        var price = prices[index]
        
        for nextPrice in prices[index + 1..<count] {  // <.. (초과 미만) 연산자가 없음
            if price >= nextPrice {
                price -= nextPrice
                print(price)
                break  // break는 for문 또는 switch문에 적용됨
            }
        }
        
        finalPrice.append(price)
    }
    
    return finalPrice
}
// 풀이
// item의 count만큼 for문을 iterate하고
// 해당 item보다 큰 index에 있는 items들을 담는 Array를 생성하고
// item과 Array의 item 가격을 비교하여 최종 가격을 산정함

// 다른 풀이
func finalPrices(_ prices: [Int]) -> [Int] {
    var finalPrice: [Int] = []
    let count = prices.count
    
    for i in 0..<count {
        var price = prices[i]
        
        for j in i + 1..<count {
            if price >= prices[j] {  // 개선
                price -= prices[j]
                break
            }
        }
        
        finalPrice.append(price)
    }
    
    return finalPrice
}
// 첫 번째 방법처럼 새로운 Array를 만들지 않고
// prices[j] 형태로 배열에 접근함 (약 30ms 빨라짐)
