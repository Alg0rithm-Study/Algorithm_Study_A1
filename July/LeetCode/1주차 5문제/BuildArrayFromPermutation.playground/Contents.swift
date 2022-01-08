import Foundation

//1번
//class Solution {
//    func buildArray(_ nums: [Int]) -> [Int] {
//        nums.map { nums[$0] }
//    }
//}

//2번

//class Solution {
//    func getConcatenation(_ nums: [Int]) -> [Int] {
//        nums + nums
//    }
//}

//3번
//class Solution {
//    func finalValueAfterOperations(_ operations: [String]) -> Int {
//        operations.map { $0 == "++X" || $0 == "X++" ? 1 : -1}.reduce(0,+)
//    }
//}

//4번

//class Solution {
//    func mostWordsFound(_ sentences: [String]) -> Int {
//        sentences.map { $0.components(separatedBy: " ").count }.sorted(by: { $0 > $1} )[0]
//    }
//}
//

//5번

//class Solution {
//    func runningSum(_ nums: [Int]) -> [Int] {
//        (0..<nums.count).map { nums[0...$0].reduce(0,+) }
//    }
//}
var a = (0 - 10)

print(a)
