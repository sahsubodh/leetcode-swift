import UIKit

var str = "Hello, playground"

/*
 Given the root of a binary tree, find the maximum average value of any subtree of that tree.

 (A subtree of a tree is any node of that tree plus all its descendants. The average value of a tree is the sum of its values, divided by the number of nodes.)

  

 Example 1:



 Input: [5,6,1]
 Output: 6.00000
 Explanation:
 For the node with value = 5 we have an average of (5 + 6 + 1) / 3 = 4.
 For the node with value = 6 we have an average of 6 / 1 = 6.
 For the node with value = 1 we have an average of 1 / 1 = 1.
 So the answer is 6 which is the maximum.
  

 Note:

 The number of nodes in the tree is between 1 and 5000.
 Each node will have a value between 0 and 100000.
 Answers will be accepted as correct if they are within 10^-5 of the correct answer.
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
 

class Solution {
    func maximumAverageSubtree(_ root: TreeNode?) -> Double {
        return helper(root)[2]
    }
    
    func helper(_ root: TreeNode?) -> [Double] {
        if root == nil {
            return [0,0,0] // sum, count  & average of nodes
        }
        let l:[Double] = helper(root?.left)
        let r:[Double] = helper(root?.right)
        
        let child = max(l[2], r[2])  // larger of the children.
        
        let sum = Double(root!.val) + l[0] + r[0]
        let count = 1 + l[1] + r[1]
        
        let maxOfThree = max(child, sum/count)
        
        return [sum,count,maxOfThree]
        
    }
}
