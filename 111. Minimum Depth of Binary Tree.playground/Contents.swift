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
    func minDepth(_ root: TreeNode?) -> Int {
        var root = root
        if (root == nil) {
            return 0
        }
        
        var level = 1
        var queue:[TreeNode] = []

        queue.append(root!)
        
        while (!queue.isEmpty) {
            var size = queue.count
            while (size > 0) {
                var node = queue.removeFirst()
                
                if node.left == nil && node.right == nil {
                    return level
                }
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
                
                size -= 1
            }
            
            level += 1
        }
        
        return level
    }
}
