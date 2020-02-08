import UIKit

var str = "Hello, playground"

/**
 * Definition for a binary tree node.*/
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
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var stack:[TreeNode] = []
        var output:[Int] = []
        
        guard let root = root else {
            return []
        }
        
        stack.append(root)
        
        while (!stack.isEmpty){
            let head = stack.removeLast()
            output.append(head.val)
            
            if let left = head.left  {
                stack.append(left)
            }
            
            if let right = head.right  {
                stack.append(right)
            }
            
        }
        
        return output
    }
}
