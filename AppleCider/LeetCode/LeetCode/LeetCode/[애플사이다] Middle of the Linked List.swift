import Foundation

func middleNode(_ head: ListNode?) -> ListNode? {
    var count: Int = 0
    var finderToTail = head

    while let currentNode = finderToTail {
        count += 1
        finderToTail = currentNode.next
    }

    var indexToFind = Int(count / 2)

    var result = head
    for _ in 0..<indexToFind {
        result = result?.next
    }

    return result
}

// 다른 풀이
func middleNode(_ head: ListNode?) -> ListNode? {
    var found = [ListNode?]()
        var node = head
    
    while(node != nil) {
        found.append(node)
        node = node?.next
    }
    
    return found[found.count / 2]
}
// 1) Node 자체를 Array에 append함
// 2) Array 개수의 절반에 위치한 중간 Node에 `found[found.count / 2]` 형태로 접근함
// ex. 5개라면 5/2 = 2.5인데 내림되어 (truncatedTail) found[2]가 됨 (index는 0부터 시작이므로 moddle Node 2개 중 second middle Node가 반환됨)

// 다른 풀이
func middleNode(_ head: ListNode?) -> ListNode? {
    var (fast, slow) = (head, head)
 // var slow = head, fast = head  // 이것도 가능
    
    while fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    
    return slow
}
// fast 포인터 및 slow 포인터를 활용함
// fast 포인터는 2개 Node씩, slow 포인터는 1개 Node씩 움직임
// fast 포인터의 다음 Node가 nil일 때, slow 포인터에 담긴 Node를 반환
