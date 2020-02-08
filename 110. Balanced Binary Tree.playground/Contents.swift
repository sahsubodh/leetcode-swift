import UIKit

var str = "Hello, playground"


/**
 * Definition for a binary tree node. */
  public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init(_ val: Int) {
          self.val = val
          self.left = nil
          self.right = nil
      }
  }
 
class Solution {
    
    private func height(_ root :TreeNode?) -> Int{
        if root == nil {
            return -1
        }
        
        return 1 + max(height(root?.left), height(root?.right))
    }
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        return abs(height(root?.left) - height(root?.right)) < 2
            && isBalanced(root?.left)
            && isBalanced(root?.right)
    }
}
