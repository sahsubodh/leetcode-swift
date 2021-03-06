import UIKit

var str = "Hello, playground"


/*Given a binary tree, you need to compute the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

Example:
Given a binary tree
          1
         / \
        2   3
       / \
      4   5
Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].

Note: The length of path between two nodes is represented by the number of edges between them.
 */

/**
  Definition for a binary tree node. */
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
    
    var maxlength = 0
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    
        maxDepth(root)
        return maxlength
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var left = maxDepth(root?.left)
        var right = maxDepth(root?.right)
        
        maxlength = max(maxlength,right+left)
        
        return max(left,right) + 1
    }
    
    
}
