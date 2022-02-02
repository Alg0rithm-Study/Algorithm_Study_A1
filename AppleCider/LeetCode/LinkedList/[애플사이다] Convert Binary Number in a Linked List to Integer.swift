import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func getDecimalValue(_ head: ListNode?) -> Int {
        var arr: [Int] = []
        var finderToTail: ListNode? = head
        
        while let currentNode = finderToTail {
            arr.append(currentNode.val)
            finderToTail = currentNode.next
        }
        
        return Int(arr.map { String($0) }.joined(), radix: 2)!
    }
}
// 풀이
// 존재하는 node를 확인하고 value를 하나씩 꺼내어 배열에 넣음
// Int 배열을 String 배열로 만들고 joined를 통해 하나의 String으로 바꾸고 이진법을 십진법으로 변환

// 다른 답변 (Faster than 100%)
func getDecimalValue(_ head: ListNode?) -> Int {
  var strNum = ""  // 배열이 아니라 String에 append 함
  var currentNode = head

  while let node = currentNode {
    strNum.append(Character(String(node.val)))  // Int -> String -> Character 타입 변환
    currentNode = node.next
  }

  return Int(strNum, radix: 2)!
}

// 다른 답변
func getDecimalValue(_ head: ListNode?) -> Int {
    var value = 0
    var next = head
    while let node = next {
        value = (value * 2) + node.val  // while문 내부에서 이진수를 십진수로 변환
        next = node.next
    }
    return value
}
