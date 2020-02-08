import UIKit

var str = "Hello, playground"


/*
 Given a non-empty binary tree, find the maximum path sum.

 For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.

 Example 1:

 Input: [1,2,3]

        1
       / \
      2   3

 Output: 6
 Example 2:

 Input: [-10,9,20,null,null,15,7]

    -10
    / \
   9  20
     /  \
    15   7

 Output: 42
 
 */

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
 

//Each node actually has two roles when it comes to function pathSum. When processing the final result max_sum, the node is treated as the highest point of a path. When calculating its return value, it is only part of a path (left or right part), and this return value will be used to calculate path sum of other paths with some other nodes(above the current one) as their highest point.



class Solution {
    
    var max_sum = Int.min
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        
        guard  root != nil else {
            return 0
        }
        
        pathSum(root)
        
        return max_sum
    }
    
    func pathSum(_ node: TreeNode?) -> Int {
        
        if node == nil {
            return 0
        }
        
        let leftSum = max(0, pathSum(node?.left))
        let rightSum = max(0, pathSum(node?.right))
        
        let currentSum = node!.val + leftSum + rightSum
        
        
        max_sum = max(max_sum, currentSum)
        
        return node!.val + max(leftSum, rightSum)
        
    }
    
}
