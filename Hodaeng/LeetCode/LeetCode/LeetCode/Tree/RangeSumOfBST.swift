import Foundation


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class SolutionTreeA {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var result = 0
        
        func traversePreOrder(root: TreeNode?) {
            if let root = root {
                if root.val > high || root.val < low {
                    traversePreOrder(root: root.left)
                    traversePreOrder(root: root.right)
                } else {
                    result += root.val
                    traversePreOrder(root: root.left)
                    traversePreOrder(root: root.right)
                }
            }
        }
        
        traversePreOrder(root: root)
        
        return result
    }
}
