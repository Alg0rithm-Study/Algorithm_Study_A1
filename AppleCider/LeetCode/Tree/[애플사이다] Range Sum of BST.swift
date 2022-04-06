import Foundation

func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
    var result: Int = 0
    let range = low...high
    
    if let value = root?.val, value < low || value > high {
        result += rangeSumBST(root?.left, low, high)  // 왼쪽 오른쪽 다 타야함
        result += rangeSumBST(root?.right, low, high)
    } else if let value = root?.val {
        result += value
        result += rangeSumBST(root?.left, low, high)
        result += rangeSumBST(root?.right, low, high)
    }
    
    return result
}
