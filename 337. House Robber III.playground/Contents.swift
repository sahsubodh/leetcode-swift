import UIKit

var str = "Hello, playground"

/*The thief has found himself a new place for his thievery again. There is only one entrance to this area, called the "root." Besides the root, each house has one and only one parent house. After a tour, the smart thief realized that "all houses in this place forms a binary tree". It will automatically contact the police if two directly-linked houses were broken into on the same night.

Determine the maximum amount of money the thief can rob tonight without alerting the police.

Example 1:

Input: [3,2,3,null,3,null,1]

     3
    / \
   2   3
    \   \
     3   1

Output: 7
Explanation: Maximum amount of money the thief can rob = 3 + 3 + 1 = 7.
Example 2:

Input: [3,4,5,1,3,null,1]

     3
    / \
   4   5
  / \   \
 1   3   1

Output: 9
Explanation: Maximum amount of money the thief can rob = 4 + 5 = 9. */


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
    
    func rob(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let answer = helper(root)

        return max(answer.0, answer.1)
    }
    
    func helper(_ root: TreeNode?) -> (Int, Int) {
        
        guard let root = root else {
            return (0,0)
        }
        
        let left = helper(root.left)
        let right = helper(root.right)
        
        // rob current house, so cannot rob left and right nodes
        let cur = left.0 + right.0 + root.val
         // not rob current house, max result of four different cases with/out left/right node
        let nocur = max(left.0, left.1) + max (right.0,right.1)
        
        return (nocur,cur)
    }
    
    
    
    func rob1(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var val = 0
        
        if root?.left != nil {
            val += rob(root?.left?.left) + rob(root?.left?.right)
        }
        
        if root?.right == nil {
            val += rob(root?.right?.left) + rob(root?.right?.right)
        }
        
      
        return max(val + root!.val, rob(root?.left) + rob(root?.right))
        
    }
}
