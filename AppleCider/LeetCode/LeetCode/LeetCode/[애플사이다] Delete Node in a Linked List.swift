import Foundation

func deleteNode(_ node: ListNode?) {
    let nextNode = node!.next!
    node?.val = nextNode.val
    node?.next = nextNode.next
}
// 풀이
// 문제에서 주어진 node가 tail이 아님을 보장했음을 이용
// 주어진 node를 nextNode와 동일하게 만들고 nextNode를 삭제
